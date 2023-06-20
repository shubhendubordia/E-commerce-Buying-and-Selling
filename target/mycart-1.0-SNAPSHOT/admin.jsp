<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entites.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.entites.User"%>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        session.setAttribute("message", "you are Not Logged In!!!Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "you are not admin do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>









<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container admin">
            
            <div class="container-fluid">
                <%@include file="components/message.jsp" %>
            </div>
            
            <div class="row mt-3">
                <div class="col-md-4">
                    <!--first box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid rounded-circle" src="img/man.png" alt="user_icon">
                            </div>
                            <h1>123</h1>
                            <h1 class="text-uppercase text-muted">User</h1>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <!--second box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid rounded-circle" src="img/checklist.png" alt="user_icon">
                            </div>
                            <h1>123</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>

                </div>
                <div class="col-md-4">
                    <!--third box-->
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid rounded-circle" src="img/new-product.png" alt="user_icon">
                            </div>
                            <h1>123</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>

                </div>
            </div>
            <!--second row-->
            <div class="row">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid rounded-circle" src="img/smart-key.png" alt="user_icon">
                            </div>
                            <p>Click Here to Add New Category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 125px " class="img-fluid rounded-circle" src="img/add-user.png" alt="user_icon">
                            </div>
                            <p> Click here to Add Product</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--add category modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method ="post">
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitlte" placeholder="Enter Category Title" required/>

                            </div>
                            <div class="form-group">
                                <textarea style="height: 300px;" class="form-control" placeholder="Enter Category Description" name="catDesc"></textarea>
                            </div>
                            <div clas="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                            </div>



                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>


        <!--end category modal-->
        
        
        <!--Add product Modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg " role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet2" method="post" enctype="mutipart/from-data">
                            
                            <input type="hidden" name="operation" value="addproduct"/>
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="pName" placeholder="Enter Prodcut name" required/>

                            </div>
                            <div class="form-group">
                                <textarea style="height: 100px;" class="form-control" placeholder="Enter product Description" name="pDesc"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pPrice" placeholder="Enter Prodcut price" required/>

                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pDiscount" placeholder="Enter Prodcut Discount " required/>

                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="pQuantity" placeholder="Enter Prodcut Quantity" required/>

                            </div> 
                            
                            <!--ProductCategory-->
                            <%
                            CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
                            List<Category> list=cDao.getCategories();
                            
                            %>
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">
                                    <%
                                        for(Category c:list){
                                           %> 
                                           <option value="<%=c.getCategoryId()%>"> <%=c.getCategoryTitle()%></option>
                                           <% }%>
                                       
                                    
                                    
                                    
                                    
                                </select>

                            </div> 
                            
                            <!--product file-->
                            
                            <div class="form-group">
                                <label for="pPic">Select Picture of Product</label>
                                <input type="file" id="pPic" name="pPic" />
                            </div>
                            
                            <div clas="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                            </div>



                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>


        <!--End product modal-->
    </body>
</html>
