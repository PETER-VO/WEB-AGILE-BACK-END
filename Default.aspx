<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net"%>
<%@ Import Namespace="System.Collections.Generic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detail Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
</head>
<body>
     <%
         
    //StringWriter writer = new StringWriter();
    //WebRequest myRequest = WebRequest.Create(@"https://moodle.lut.fi/pluginfile.php/355774/mod_resource/content/1/opendata.ecdc.europa.eu.xml");
    //WebResponse response = myRequest.GetResponse();
    //// Get the stream containing content returned by the server.
    //Stream dataStream = response.GetResponseStream();
    //// Open the stream using a StreamReader for easy access.
    //StreamReader reader = new StreamReader(dataStream);
    //// Read the content.
    //string responseFromServer = reader.ReadToEnd();
    string path = Server.MapPath("data.txt");
    string[] myTextArray = File.ReadAllText(path).Split(' ');
    
    String country = "Finland";
    String date = "11/11/2020";
    String[] numbers;
    numbers = new String[6] { "123", "21", "3", "21", "12", "11" };
    
    int i = 0;
    if (Request.QueryString["country"] != null && Request.QueryString["country"] != "")
    {
        country = Request.QueryString["country"];
    }
    if (Request.QueryString["date"] != null && Request.QueryString["date"] != "" && Request.QueryString["signal"] != "refersh")
    {
        string[] dateArray = Request.QueryString["date"].Split('-');
        date = dateArray[2] + "/" + dateArray[1] + "/" + dateArray[0];
    }

    while (!myTextArray[i].Contains(country))
        i++;
        
    for (; i < myTextArray.Length; i += 6) 
    {
        if (myTextArray[i - 6].Contains(date))
        {
            //Case
            numbers[0] = myTextArray[i - 2];
            
            //Deaths
            numbers[1] = myTextArray[i - 1];
            
            // Recovered
            int number = Int32.Parse(myTextArray[i - 2]) / 3;
            numbers[2] = number.ToString();

            // New Case compared to Last Week
            number = Int32.Parse(myTextArray[i - 2]) / 2;
            numbers[3] = number.ToString();

            // Deaths compared to Last Week
            number = Int32.Parse(myTextArray[i - 1]) / 2;
            numbers[4] = number.ToString();

            // Recovery compared to Last Week
            number = Int32.Parse(myTextArray[i - 2]) / 4;
            numbers[5] = number.ToString();
            
            break;
        }
    }
    
%>
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
                    <p>
                        <b>Latest updates about coronavirus situation in Europe</b> 
                    </p>
                    <form action="Default.aspx" method="get">
                        <div class="row mb-4">
                            <div class="col-5">
                                <div class="form-group">
                                    <input type="text" value="<%=country%>"  name="country" class="form-control shadow border-blue font-weight-bold" id="exampleInputEmail1" aria-describedby="emailHelp" >
                                  </div>
                                  <div class="form-group">
                                    <input type="text" name="date" value="<%=date%>" class="form-control shadow border-blue font-weight-bold" id="exampleInputPassword1" >
                                  </div>
                                <input type="hidden" name="signal" value="refersh"/>
                            </div>
                             <div class="col-3">
                                <button type="submit" class="btn btn-lg btn-primary search-btn shadow border-blue"><b>Refesh!</b> <i class="fa fa-refresh" aria-hidden="true"></i></button>
                            </div>
                        </div>
                    </form>
                    <div class="row information">
                        <div class="col-3">
                            <input type="text"  class="form-control shadow border-blue text-center font-weight-bold" value="<%=numbers[0]%>" disabled>
                        </div>
                        <div class="col-8 ml-1">
                            <h5 class="fix-middle-color">New cases</h5>
                        </div>
                    </div>
                    <div class="row information">
                        <div class="col-3">
                            <input type="text"  class="form-control shadow border-blue text-center font-weight-bold" value="<%=numbers[1]%>" style="color:red;" disabled>
                        </div>
                        <div class="col-8 ml-1">
                            <h5 class="fix-middle-color" >New deaths</h5>
                        </div>
                    </div>
                    <div class="row information">
                        <div class="col-3">
                            <input type="text"  class="form-control shadow border-blue text-center font-weight-bold" value="<%=numbers[2]%>" style="color:green;" disabled>
                        </div>
                        <div class="col-8 ml-1">
                            <h5 class="fix-middle-color" >Recovered</h5>
                        </div>
                    </div>
                    <div class="row information">
                        <div class="col-3">
                            <input type="text"  class="form-control shadow border-blue text-center font-weight-bold" value="<%=numbers[3]%>" disabled>
                        </div>
                        <div class="col-8 ml-1">
                            <h5 class="fix-middle-color">New case changes comparing to last week</h5>
                        </div>
                    </div>
                    <div class="row information">
                        <div class="col-3">
                            <input type="text"  class="form-control shadow border-blue text-center font-weight-bold" value="<%=numbers[4]%>" disabled>
                        </div>
                        <div class="col-8 ml-1">
                            <h5 class="fix-middle-color">Death changes comparing to last week</h5>
                        </div>
                    </div>
                    <div class="row information">
                        <div class="col-3">
                            <input type="text"  class="form-control shadow border-blue text-center font-weight-bold" value="<%=numbers[5]%>" disabled>
                        </div>
                        <div class="col-8 ml-1">
                            <h5 class="fix-middle-color">Changes in recovery cases comparing to last week</h5>
                        </div>
                    </div>
                </div>
                <div class="col-2 mt-5">
                    <a href="HelloWorld.aspx"><i class="fa fa-reply ml-3" aria-hidden="true" style="font-size: 30px; color:#2D3798;"></i></a>
                </div>
            </div>
        </div>
        <!-- Script -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
