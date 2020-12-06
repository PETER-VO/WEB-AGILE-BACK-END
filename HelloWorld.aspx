<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HelloWorld.aspx.cs" Inherits="WebApplication1.HelloWorld" %>

<!DOCTYPE html>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net"%>
<%@ Import Namespace="System.Collections.Generic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div>

</div>
    <div class="createdContainer">
        <div class="row">
            <div class="col-9 ml-5">
                <div class="row mt-5">
                    <div class="col-5 title">
                        <h1>Covid19 Tracker</h1>
                    </div>
                    <div class="col-3 ">
                        <img class="img-logo shadow" src="covid-19.JPG" alt="covid-19 image">
                    </div>
                </div>
                <p><b>Latest updates about coronavirus situation in Europe</b></p>
                <form action="Default.aspx" method="get">
                    <%
                            String[] countries = {"Russia", "Germany", "United Kingdom","France","Italy","Spain","Ukraine","Poland","Romania","Netherlands","Belgium",
                        "Czechia", "Greece","Portugal","Sweden","Hungary","Belarus","Austria","Serbia","Switzerland","Bulgaria","Denmark","Finland","Slovakia","Norway","Ireland",
                        "Croatia","Moldova","Bosnia","Albania","Lithuania","North_Macedonia","Slovenia","Latvia","Estonia","Montenegro","Luxembourg","Malta","Iceland","Andorra","Monaco",
                        "Liechtenstein","San_Marino","Holy_See" };
                         %>
                    <div class="row">
                        <div class="col-5">
                            <select class="custom-select my-1 mr-sm-2 shadow border-blue" id="inlineFormCustomSelectPref" name="country">
                                <option value="" selected>Select a Country...</option>
                                <%
                                    for (int j = 0; j < countries.Length; j++)
                                    {
                                        Response.Write("<option value=\"" + countries[j] + "\">" + countries[j] + "</option>");
                                    }
                                 %>
                            </select>
                            <div class="form-group">
                                <input type="date" class="form-control shadow border-blue" id="exampleInputPassword1" value="" name="date">
                            </div>
                        </div>
                        <div class="col-3">
                            <button type="submit" class="btn btn-lg btn-primary search-btn shadow border-blue"><b>Get Data!</b></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-3"></div>
        </div>
    </div>
    <!-- Script -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js" integrity="sha512-YSdqvJoZr83hj76AIVdOcvLWYMWzy6sJyIMic2aQz5kh2bPTd9dzY3NtdeEAzPp/PhgZqr4aJObB3ym/vsItMg==" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
