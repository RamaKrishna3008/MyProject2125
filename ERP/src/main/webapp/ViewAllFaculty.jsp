<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>ERP</title>
    <style>
<style>
    #myTableContainer {
        width: 90%;
        margin: auto;
        margin-top: 20px;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    #myTable {
        width: 100%;
        border-collapse: collapse;
        font-size: 16px;
        background-color: #ffffff;
    }

    #myTable th, #myTable td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #dddddd;
    }

    #myTable th {
        background-color: black;
        color: white;
        font-weight: bold;
        text-align: center;
    }

    #myTable tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    #myTable tr:nth-child(odd) {
        background-color: #f2f2f2;
    }

    #myTable tr:hover {
        background-color: #d1e7dd;
    }

    #myInput {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 20px;
        box-sizing: border-box;
    }
</style>


       
    <script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
    
</head>

<body>


<h3 align=center><u>View All Faculty</u></h3>

<br>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter faculty Name">

<table align=center border=2 id="myTable">

<tr class="header">

<th>ID</th>
<th>Name</th>
<th>Username</th>
<th>Email</th>
<th>Contact No</th>
</tr>

<c:forEach items="${facultylist}" var="faculty">

<tr>

<td> <c:out value="${faculty.id}"></c:out>  </td>
<td> <c:out value="${faculty.name}"></c:out>   </td>
<td> <c:out value="${faculty.username}"></c:out>   </td>
<td> <c:out value="${faculty.email}"></c:out>   </td>
<td> <c:out value="${faculty.contactno}"></c:out>   </td>



</tr>

</c:forEach>

</table>

    
</body>

</html>
