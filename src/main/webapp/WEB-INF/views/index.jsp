<%@ page isELIgnored = "false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Keep-Board</title>
</head>

<body>
	<!-- Create a form which will have text boxes for Note title, content and status along with a Add 
		 button. Handle errors like empty fields.  (Use dropdown-list for NoteStatus) -->


    <div class="container">

            <form action="add" method="post">

          			<div class="form-group">
                        <label for="exampleInputnoteId1">ID</label>
                        <input type="text" class="form-control" id="id" placeholder="ID" name="noteId">
                    </div>

                    <div class="form-group">
                        <label for="exampleInputTitle1">Title</label>
                        <input type="text" class="form-control" id="title" placeholder="Title" name="noteTitle">
                    </div>

                    <div class="form-group">
                        <label for="exampleNoteContent1">Title</label>
                        <input type="textarea" class="form-control" id="noteContent" placeholder="NoteContent" name="noteContent">
                    </div>

                    <div class="form-group">
                        <select id="noteStatus" name= "noteStatus">
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
             </form>




	<!-- display all existing notes in a tabular structure with Title,Content,Status, Created Date and Action -->

        <small style ="color:green" id="status"></small>
        <small style ="color:red" id="errMessage"></small>
                  <table class="table table-dark mt-5">
                        <thead>
                          <tr>
                          	<th scope="col">Id</th>
                            <th scope="col">Title</th>
                            <th scope="col">Content</th>
                            <th scope="col">Status</th>
                            <th scope="col">Date</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
                          </tr>
                        </thead>

                      <tbody id='table-body'>
                      <!-- This should fetch the note details form DB -->
                      <c:forEach items="${notes}" var="note">
                      <tr>
                      <td>${note.noteId}</td>
                      <td>${note.noteTitle}</td>
                      <td>${note.noteContent}</td>
                      <td>${note.noteStatus}</td>
                      <td>${note.createdAt}</td>
                      <td><a href="updateNote?noteId=${note.noteId}"<button class="btn btn-primary">Update</button></a></td>
                      <td><a href="delete?noteId=${note.noteId}"<i class='fa fa-trash' style='color:red; cursor:pointer'></i></a></td>
                      </tr>

</c:forEach>
                      </tbody>
                  </table>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
  </body>
</html>
