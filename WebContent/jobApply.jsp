<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,com.JobShikari.create_job.*,com.JobShikari.employeeRegistration.*"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Apply for the Job</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body>
<%
	JobModel job = (JobModel)request.getSession().getAttribute("job_details");
%>
    <center>
        <div class="card" style="border: 5px solid black;">
                <div class="card-header">
                        <h1 class="card-title"><strong><%=job.getJob_title() %></strong></h1>
                </div>
            </center>  

                <div class="card-body" style=" margin: 100px; padding:150px; border: 2px solid black;">
                  
                  <p class="card-text"><strong><u>Location:</u> <%=job.getLocation() %></strong></p>
                  <p><strong><u>Preffered gender:</u> <%=job.getGender() %></strong></p>
                  <p><strong><u>Qualification:</u> <%=job.getQualification() %></strong></p>
                  <p><strong><u>Salary:</u> <%=job.getSalary() %></strong></p>
                  <p><strong><u>Experience Required:</u> <%=job.getExperience() %></strong></p>
                  <p><strong><u>Job type:</u> <%=job.getJob_type() %></strong></p>
                  <p><strong><u>Industry:</u> <%=job.getIndustry() %></strong></p>
                  <p><strong><u>Preffered Language:</u> <%=job.getLang_req() %></p></strong>
                  <p><strong><u>Job responsibility:</u> <%=job.getJob_resp() %></strong></p>
                  <p><strong><u>Skills Required:</u> <%=job.getSkills() %></strong></p>
                  <p><strong><u>Benifits (if any):</u> <%=job.getBenefits() %></strong></p>
                  <p><strong><u>Job Description:</u> <%=job.getJob_desc() %></strong></p>
                  <p><strong><u>Resume:</u>&nbsp&nbsp&nbsp</strong><input type="file" id="myFile"></p>
                  
                <center>
                    <footer>
                        <br><br><br>
                  
                    <form action="EmployeeJobAppServlet" method="POST">
                  <button type="submit" class="btn btn-success">Apply</button>
                  <button class="btn btn-danger" type="button" value="Go back!" onclick="history.back()">Go Back</button>
                </form>
            </footer>
                  
                </div>
              </div>
            </center>  
</body>
<style>
.card
{
    margin: 100px;
    padding:50px;
}


</style>
<script>

</script>
</html>