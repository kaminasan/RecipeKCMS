<%-- 
    Document   : recentrecipes
    Created on : Nov 20, 2015, 1:50:14 AM
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

            <%-- here is where your page content will go --%>
            <div class="row">
                <ul class="list-inline text-center">
                    <c:if test="${currentPage > 1}">
                        <li><a href="/recipes/recent/${currentPage -1}" class="btn-danger btn"><i class="fa fa-arrow-left"></i> Prev.</a></li>
                        </c:if>
                        <c:forEach begin="${startPage}" var ="page" end="${endPage}" >
                            <c:choose>
                                <c:when test="${page == currentPage}">
                                <li><button type="button" class="btn btn-default">${page}</button></li>
                                </c:when>
                                <c:otherwise>
                                <li><a href="/recipes/recent/${page}" class="btn btn-danger">${page}</a></li>
                                </c:otherwise>
                            </c:choose>

                    </c:forEach>
                    <c:if test="${currentPage < endPage}">
                        <li><a href="/recipes/recent/${currentPage + 1}" class="btn-danger btn">Next <i class="fa fa-arrow-right"></i></a></li>
                        </c:if>
                </ul>
            </div>
            <jsp:include page="/WEB-INF/fragments/postiterator.jsp"></jsp:include> <%-- Here is where our posts will be displayed from the attribute postList --%>
            


            <%@include file="/WEB-INF/fragments/footer.jsp" %>
        </div> <!-- Container -->

        <%@include file="/WEB-INF/fragments/bodyscripts.jsp" %>
    </body>
</html>

