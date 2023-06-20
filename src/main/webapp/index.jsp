

<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entites.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entites.Product"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MyCart</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container">
        <div class="row mt-3 mx-2">
            
            <%     
                String cat = request.getParameter("category");
//                out.println(cat);
                
                
                ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                List<Product> list =null;
               
                 if(cat == null || cat.trim().equals("all"))
                {
                    
                    list= dao.getAllProducts();
                    
                }
                else
                {
                    
                   int cid = Integer.parseInt(cat.trim());
                    list = dao.getAllProductsById(cid);
                    
                }
                
                
                
                
                
                
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> clist = cdao.getCategories();


            %>
            <!--Show Category-->
            <div class="col-md-2">
                <div class="list-group mt-4">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">

                        All Products

                    </a>





                    <%                    for (Category c : clist) {

                    %>
                    <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                    <%                            }


                    %>
                </div>


            </div>
            <!--Show Products-->
            <div class="col-md-10">
                <div class="row mt-4">
                    
                    <div class="col-md-12">
                        
                        <div class="card-colums">
                            
                            <!--Traversing Product-->
                            <%
                            
                                
                                
                                for(Product p:list){
                                
                            
                            
                            
                            %>
                            
                            <div class="card">
                                
                                <div class="card-body">
                                    
                                    <h5 class="card-title"><%= p.getpName()%></h5>
                                    
                                    <p class="card-text">
                                        <%= Helper.get10Words(p.getpDesc())%>
                                        
                                        
                                    </p>
                                    
                                </div>
                                        <div class="card-footer">
                                            
                                            <button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>,<%=p.getpName()%>,<%=p.getpPrice()%>)">Add to Cart</button>
                                            <button class="btn btn-outline-primary"> <%=p.getpPrice()%><span class="text-secondry discount-label"> <%=p.getpDiscount()%>%off</span></button>
                                            
                                        </div>
                                
                                
                            </div>
                            
                            
                            <%}%>
                            
                            
                            
                            
                        </div>
                        
                    </div>
                </div>

            </div>


        </div>
        </div>

    </body>
</html>
