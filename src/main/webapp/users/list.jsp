<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/fragments/header.jsp" %>

<!-- Page Heading -->
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Lista użytkowników:</h1>
    <a href="/users/add.jsp" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
            class="fas fa-download fa-sm text-white-50"></i> Stwórz nowego użytkownika</a>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Nazwa użytkownika</th>
                            <th>E-mail</th>
                            <th>Akcje</th>
                        </tr>
                        </thead>
                        <c:choose>
                            <c:when test="${users!=null}">
                                <c:forEach items="${users}" var="users">
                                    <tr>
                                        <th><c:out value="${users.username}"/></th>
                                        <th><c:out value="${users.email}"/></th>
                                        <th>
                                            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                                                <a href="/show?email=${users.email}">pokaż</a>
                                                <a href="/edit?email=${users.email}">edytuj</a>
                                                <a href="/delete?email=${users.email}">usuń</a>
                                            </div>
                                        </th>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <th rowspan="3">Brak użytkowników :(</th>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
    <!-- End of Main Content -->

    <%@ include file="/fragments/footer.jsp" %>
