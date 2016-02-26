<%-- 
    Document   : recipesubmit
    Created on : Nov 23, 2015, 1:50:14 AM
    Author     : KaminaSan <www.kaminasan.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>

        <%@include file="/WEB-INF/fragments/htmlhead.jsp" %>
    </head>
    <body>
        <%@include file="/WEB-INF/fragments/socialintents.jsp" %>

        <%@include file="/WEB-INF/fragments/navbarsection.jsp" %>

        <div id="mainContainer" class="container-fluid"><!-- main container -->
            <%@include file="/WEB-INF/fragments/logosection.jsp" %> 

            <article class="container" id="addPostContainer">
                <header id="addPostHeader" class="page-header text-center"><h1>Edit a Recipe(NOT FUNCTIONING CURRENTLY)</h1></header>
                <div id="addPostWrapper" class="">
                  
                        <form method="POST" id="recipeTitleForm">
                               <input type="hidden" name = "postId" value="${post.postId}">
                               <input type="hidden" name="editType" value="recipeTitle">
                            <div class="form-group ">
                        <label id="recipetTitleLabel" for="recipeTitleInput">Recipe Title:</label>
                        <input type="text" class="form-control" maxlength="255"  id="recipeTitleInput" name="recipeTitle" value="${post.postTitle}" placeholder="Recipe title!" onkeyup="syncTitle(this)" required>
                        <button type="submit" class="btn btn-danger">Save Edited Recipe Title</button>
                        </div>
                        </form>
                        
                         <div class="row">
                                <div class="form-group col-lg-8">
                         <form method="POST" id="recipeIngredientForm">
                                <input type="hidden" name = "postId" value="${post.postId}">
                                 <input type="hidden" name="editType" value="recipeIngredients">
                        <label id="recipeIngredientLabel" class="" for="recipeIngredientTextArea">Type Your Ingredients Here, separated by a new line.</label>
                        <textarea id="recipeIngredientTextArea" class="form-control" name="recipeIngredients" placeholder="E.G.: 1 cup milk"  rows="5" cols="30" required>${post.postContent}</textarea>
                        <button type="submit" class="btn btn-danger">Save Edited Ingredients List</button>
                        </form>
                     </div>
                             <div class="col-lg-4 col-sm-12 col-md-4">
                                 <form method="POST" id="recipeCategoryForm">
                                       <input type="hidden" name = "postId" value="${post.postId}">
                                        <input type="hidden" name="editType" value="postCategory[]">
                                   <label id="postCategoryLabel" class="" for="postCategoryList">Categories(Use ctrl to select multiple categories)</label>
                                   <select id="postCategoryList" name="postCategory[]" class="form-control " multiple size="5" required>
                            <c:forEach items="${categoryList}" var="category">
                                <option value="${category["categoryId"]}">${category["categoryName"]}</option>
                            </c:forEach>
                        </select>
                                    <button type="submit" class="btn btn-danger">Save Edited Categories List</button>
                                   </form>
                             </div>
                      
                       
                     </div>
                         <div class="form-group" >
                        <form method="POST" id="recipeSummaryForm">
                            <input type="hidden" name = "postId" value="${post.postId}">
                             <input type="hidden" name="editType" value="recipeSummary">
                        <label id="postSummaryLabel" class="" for="recipeSummaryTextArea">Recipe Summary</label>
                        <textarea id="recipeSummaryTextArea" class="form-control " name="recipeSummary" placeholder="Insert Your Recipe Summary"  rows="2" cols="30" onkeyup="syncDescription(this)" required>${post.postSummary}</textarea>
                         <button type="submit" class="btn btn-danger">Save Edited Recipe Summary</button>
                        </form>
                        </div>
                    
                     
                   
                     <div><h3 class="page-header">Add your steps!</h3></div>
                     <div id="stepSection" class=""></div>
                     <form method="POST" id="recipeStepForm">
                        <input type="hidden" name = "postId" value="${post.postId}">
                         <input type="hidden" name="editType" value="recipeStepList[]">
                     <div class="form-group">
                         <label id="addStepSection" for="stepAdderTextArea">Add Steps. One step on each line.</label>
                            <textarea id="stepAdderTextArea" class="form-control " name="recipeStepList[]" placeholder="Mix Ingredients"  rows="2" cols="30" required><c:forEach var="step" items="${post['recipeSteps']}"> ${step["stepSummary"]}</c:forEach></textarea>                     
                     </div>
                    <button type="submit" class="btn btn-danger">Save Edited Steps</button>
                     </form>

                </div>

            </article>
            
            <div class="previewSection">
                  <div id="postPageContentContainer" class="container">
                      <div class="row">
                    <div id ="imageContainer" class="col-lg-4 col-md-4 col-sm-4">
                        <img src="/Images/plate_logo.png" id="recentPostImage">
                        <h3 id="previewImageText">Preview Here</h3>
                    </div>
                        <div id="postSummaryContainer" class="col-lg-8 col-md-8 col-sm-8"><div id="postHeader" class="page-header">${post.postTitle}</div>
                           
                            <div class="col-xs-12 col-sm-6" id="summarySection">
                                <p id="postSummarySection">${post.postSummary}</p>
                            </div>
                        
                            <div class="col-xs-12 col-sm-6" id="ingredientSection">
                                <h3 class="page-header">Ingredients:</h3>
                                <ul id="ingredientListPreview">
                                    <li>Test Ingredient 1</li>
                                    <li>Test Ingredient 2</li>
                                    <li>Test Ingredient 3</li>
                                     
                                </ul>
                            </div>
                           
                    </div>
              </div>
                                    
                         <div id="stepSectionReflect" class="row">
                                <div class="page-header">How To Make:(Your steps will appear here when you click out of the Step input Box.)</div>
                                <ol id="stepList" class="">
                                    <li>Step 1 Will appear here</li>
                                     <li>Step 2 Will appear here</li>
                                      <li>Step 3 will appear here etc...</li>
                                </ol>
                                
                            </div>     
                       <div class="row">
                         
                                     </div>
                              
                </div>
            </div>
                                    
            <%@include file="/WEB-INF/fragments/footer.jsp" %>
        </div> <!-- Container -->

        <%@include file="/WEB-INF/fragments/bodyscripts.jsp" %>
        <script src="/js/edit.js"></script>
    </body>
</html>

