<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
      <!DOCTYPE html>
      <html>
        <head>
          <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
              <meta name="description" content="">
                <meta name="author" content="">

                  <!-- Favicon data -->
                  <link rel="apple-touch-icon" sizes="180x180" href="resources/favicon/apple-touch-icon.png">
                    <link rel="icon" type="image/png" sizes="32x32" href="resources/favicon/favicon-32x32.png">
                      <link rel="icon" type="image/png" sizes="16x16" href="resources/favicon/favicon-16x16.png">
                        <link rel="manifest" href="resources/favicon/site.webmanifest">
                          <link rel="mask-icon" href="resources/favicon/safari-pinned-tab.svg" color="#5bbad5">
                            <meta name="msapplication-TileColor" content="#da532c">
                              <meta name="theme-color" content="#ffffff">
                                <title>Admin Console</title>
                                <script src="https://www.gstatic.com/firebasejs/4.8.1/firebase.js"></script>
                                <script src="resources/js/config.js"></script>
                                <!-- Bootstrap core CSS-->
                                <link href="resources/css/bootstrap.min.css" rel="stylesheet">
                                  <link href="resources/css/adminconsole.css" rel="stylesheet">
                                    <!-- Custom styles for this template-->
                                    <link href="resources/css/sb-admin.css" rel="stylesheet">

                                      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
                                      <!-- Custom styles for this template-->
                                      <link href="resources/css/sb-admin.css" rel="stylesheet">

                                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
                                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

                                        <script defer="defer" src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>

                                        <!-- Latest compiled and minified Bootstrap CSS -->
                                        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
                                          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>

                                          <link href="resources/css/modifycourse.css" type="text/css" rel="stylesheet">
                                            <!-- Include Required Prerequisites -->
                                            <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
                                            <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css"/>

                                            <!-- Include Date Range Picker -->
                                            <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
                                            <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css"/>

                                            <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
                                              <link rel="stylesheet" type="text/css" media="all" href="resources/css/daterangepicker.css"/>
                                              <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
                                              <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
                                              <script type="text/javascript" src="resources/js/moment.js"></script>
                                              <script type="text/javascript" src="resources/js/daterangepicker.js"></script>

                                            </head>
                                            <body class="fixed-nav sticky-footer bg-dark" id="page-top">

                                              <!-- Navigation-->
                                              <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
                                                <div class="collapse navbar-collapse" id="navbarResponsive">
                                                  <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                                                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Current Courses">
                                                      <a class="nav-link" href="#">
                                                        <i class="fas fa-th-list"></i>
                                                        <span class="nav-link-text">Courses List</span>
                                                      </a>
                                                    </li>
                                                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Drives">
                                                      <a class="nav-link" href="#">
                                                        <i class="far fa-calendar-alt"></i>
                                                        <span class="nav-link-text">My Drives
                                                          <br>
                                                            (Feature coming soon!)
                                                          </span>
                                                        </a>
                                                      </li>
                                                      <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Driving Log">
                                                        <a class="nav-link" href="#">
                                                          <i class="far fa-list-alt"></i>
                                                          <span class="nav-link-text">Driving Log<br>
                                                              (Feature coming soon!)
                                                            </span>
                                                          </a>
                                                        </li>
                                                        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Message">
                                                          <a class="nav-link" href="#">
                                                            <i class="far fa-envelope"></i>
                                                            <span class="nav-link-text">Contact Us
                                                              <br>
                                                                (Feature coming soon!)
                                                              </span>
                                                            </a>
                                                          </li>
                                                        </ul>
                                                        <ul class="navbar-nav sidenav-toggler">
                                                          <li class="nav-item">
                                                            <a class="nav-link text-center" id="sidenavToggler">
                                                              <i class="fa fa-fw fa-angle-left"></i>
                                                            </a>
                                                          </li>
                                                        </ul>
                                                        <ul class="navbar-nav ml-auto">
                                                          <li class="nav-item">
                                                            <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                                                              <i class="fas fa-sign-out-alt"></i>Logout
                                                            </a>
                                                          </li>
                                                        </ul>
                                                      </div>
                                                    </nav>
                                                    <div class="content-wrapper">
                                                      <div class="container-fluid">

                                                        <!-- Current Courses Detail-->
                                                        <div class="card mb-3">
                                                          <div class="card-header">
                                                            <i class="fas fa-edit"></i>
                                                            Selected Course Details
                                                          </div>
                                                          <div>
                                                            <div class="card-body">
                                                              <div class="row">
                                                                <div class="col-lg-4">
                                                                  <div class="control-group form-group">
                                                                    <div class="controls">
                                                                      <label>Program Number:
                                                                      </label>
                                                                      <input id="programNumRes" class="form-control" name="rogramNumRes" type="text" value="Me" required="required"></input>
                                                                    </div>
                                                                  </div>
                                                                </div>
                                                              </div>
                                                              <pre id="objectDetail">
					</pre>
                                                              <div class="btn-group btn-group-courses " role="group" aria-label="Basic example">
                                                                <button type="button" class="btn btn-secondary">
                                                                  Save Changes
                                                                  <i class="far fa-save"></i>
                                                                </button>
                                                                <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteCourseModal">
                                                                  > Delete Course
                                                                  <i class="far fa-trash-alt"></i>
                                                                </button>
                                                              </div>
                                                            </div>
                                                          </div>
                                                        </div>
                                                        <!-- Current Courses List-->
                                                        <div class="card mb-3">
                                                          <div class="card-header">Current Courses</div>
                                                          <div class="scroll-class">
                                                            <div id="testlist" class="list-group"></div>
                                                          </div>
                                                        </div>
                                                        <div class="row">
                                                          <div class="col-lg-8">
                                                            <!-- Example Bar Chart Card-->
                                                            <div class="card mb-3">
                                                              <div class="card-header">
                                                                <i class="fa fa-bar-chart"></i>
                                                                Bar Chart Example
                                                              </div>
                                                              <div class="card-body">
                                                                <canvas id="myBarChart" width="100" height="50"></canvas>
                                                              </div>
                                                              <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                                            </div>
                                                          </div>
                                                          <div class="col-lg-4">
                                                            <!-- Example Pie Chart Card-->
                                                            <div class="card mb-3">
                                                              <div class="card-header">
                                                                <i class="fa fa-pie-chart"></i>
                                                                Pie Chart Example
                                                              </div>
                                                              <div class="card-body">
                                                                <canvas id="myPieChart" width="100%" height="100"></canvas>
                                                              </div>
                                                              <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                                                            </div>
                                                          </div>
                                                        </div>
                                                      </div>
                                                      <!-- /.container-fluid-->
                                                      <!-- /.content-wrapper-->
                                                      <footer class="sticky-footer">
                                                        <div class="container">
                                                          <div class="text-center">
                                                            <small>Copyright � Polyservice 2018</small>
                                                          </div>
                                                        </div>
                                                      </footer>
                                                      <!-- Scroll to Top Button-->
                                                      <a class="scroll-to-top rounded" href="#page-top">
                                                        <i class="fa fa-angle-up"></i>
                                                      </a>

                                                      <script src="resources/js/modifycourse.js"></script>
                                                      <!-- Bootstrap core JavaScript-->
                                                      <script src="resources/js/jquery.min.js"></script>
                                                      <!-- Core plugin JavaScript-->
                                                      <script src="resources/js/jquery.easing.min.js"></script>
                                                      <script src="resources/js/bootstrap.bundle.min.js"></script>
                                                      <!-- Custom scripts for all pages-->
                                                      <script src="resources/js/sb-admin.min.js"></script>

                                                      <!-- Popper -->
                                                      <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>

                                                      <!-- Latest compiled and minified Bootstrap JavaScript -->
                                                      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
                                                    </div>

                                                    <!-- Logout Modal-->
                                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
                                                      <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                          <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                              <span aria-hidden="true">�</span>
                                                            </button>
                                                          </div>
                                                          <div class="modal-body">Select "Logout" below if you are sure you want to logout.</div>
                                                          <div class="modal-footer">
                                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                                            <a class="btn btn-primary" href="home">Logout</a>
                                                          </div>
                                                        </div>
                                                      </div>
                                                    </div>
                                                    <!-- Delete Course Modal-->
                                                    <div class="modal fade" id="deleteCourseModal" tabindex="-1" role="dialog" aria-labelledby="deleteCourseModalLabel" aria-hidden="true" data-backdrop="false">
                                                      <div class="modal-dialog" role="document">
                                                        <div class="modal-content">
                                                          <div class="modal-header">
                                                            <h5 class="modal-title" id="deleteCourseModalLabel">Delete course?</h5>
                                                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                                              <span aria-hidden="true">�</span>
                                                            </button>
                                                          </div>
                                                          <div class="modal-body">
                                                            <p id="deleteCourseModalLabel"></p>
                                                          </div>
                                                          <div class="modal-footer">
                                                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                                            <a class="btn btn-primary" href="#">Delete</a>
                                                          </div>
                                                        </div>
                                                      </div>
                                                    </div>
                                                  </body>
                                                </html>