<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/fragments/header.jsp" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Dane użytkownika:</h1>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <c:choose>
                    <c:when test="${user!=null}">

                        <label for="id">Id</label>
                        <input name="id" type="number" id="id" class="form-control" value="${user.id}" disabled/>
                        <label for="username">E-mail</label>
                        <input name="username" type="text" id="username" class="form-control" value="${user.username}" disabled/>
                        <label for="email">E-mail</label>
                        <input name="email" type="email" id="email" class="form-control" value="${user.email}" disabled/>
                        <label for="password">Hasło</label>
                        <input name="password" type="password" id="password" class="form-control" value="${user.password}" disabled/>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<%@ include file="/fragments/footer.jsp" %>