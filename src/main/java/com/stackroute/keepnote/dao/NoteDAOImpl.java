package com.stackroute.keepnote.dao;

import com.stackroute.keepnote.model.Note;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

/*
 * This class is implementing the NoteDAO interface. This class has to be annotated with @Repository
 * annotation.
 * @Repository - is an annotation that marks the specific class as a Data Access Object, thus
 * 				 clarifying it's role.
 * @Transactional - The transactional annotation itself defines the scope of a single database
 * 					transaction. The database transaction happens inside the scope of a persistence
 * 					context.
 * */


@Repository
@Transactional
public class NoteDAOImpl implements NoteDAO {

    /*
     * Autowiring should be implemented for the SessionFactory.
     */

    private SessionFactory sessionFactory;

    @Autowired
    public NoteDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    /*
     * Save the note in the database(note) table.
     */

    public boolean saveNote(Note note) {
        try {
            this.sessionFactory.getCurrentSession().save(note);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    /*
     * Remove the note from the database(note) table.
     */

    public boolean deleteNote(int noteId) {
        try {
            //get the data from mysql
            Note note = this.sessionFactory.getCurrentSession().load(Note.class, noteId);
            this.sessionFactory.getCurrentSession().delete(note);
            return true;
        } catch (Exception e) {
            return false;
        }
    }


    /*
     * retrieve all existing notes sorted by created Date in descending
     * order(showing latest note first)
     */
    public List<Note> getAllNotes() {
        return this.sessionFactory.getCurrentSession().createQuery("from Note").list();

    }

    /*
     * retrieve specific note from the database(note) table
     */
    public Note getNoteById(int noteId) {
        Query query = null;
        try {
            query = sessionFactory.getCurrentSession().createQuery("from Note where noteId = :noteId");
            query.setParameter("noteId", noteId);

        } catch (Exception e) {
        }
        return (Note) query.getResultList().get(0);
    }

    /* Update existing note */

    public boolean UpdateNote(Note note) {
        if (getNoteById(note.getNoteId()) == null) {
            return false;
        } else {
            sessionFactory.getCurrentSession().clear();
            sessionFactory.getCurrentSession().update(note);
            sessionFactory.getCurrentSession().flush();
            return true;
        }

    }
}
