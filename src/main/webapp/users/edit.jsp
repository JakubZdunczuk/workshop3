<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/fragments/header.jsp" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Edycja użytkownika:</h1>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <form action="/edit" method="post">
                    <div class="col-xl-12 col-md-12 mb-2">
                        <label for="id">Id</label>
                        <input name="id" type="text" id="id" required="required" class="form-control"
                                value="${user.id}" readonly>
                    </div>
                    <div class="col-xl-12 col-md-12 mb-2">
                        <label for="username">Nowa Nazwa użytkownika</label>
                        <input name="username" type="text" id="username" required="required" class="form-control"
                               placeholder="Nazwa użytkownika" value="${user.username}">
                    </div>

                    <div class="col-xl-12 col-md-12 mb-2">
                        <label for="email">Nowy E-mail</label>
                        <input name="email" type="email" id="email" required="required" class="form-control"
                               placeholder="E-mail użytkownika" value="${user.email}">
                    </div>

                    <div class="col-xl-12 col-md-12 mb-2">
                        <label for="password">Nowe Hasło</label>
                        <input name="password" type="password" id="password" required="required" class="form-control" placeholder="Hasło" value="${user.password}">
                    </div>

                    <div class="col-xl-12 col-md-12 mb-2">
                        <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-address-card fa-sm text-white-50"></i> Edytuj użytkownika
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/fragments/footer.jsp" %>
