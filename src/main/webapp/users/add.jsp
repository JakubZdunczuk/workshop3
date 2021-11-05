<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/fragments/header.jsp" %>
<div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Stwórz nowego użytkownika:</h1>
</div>
<div class="row">
    <div class="col-xl-12 col-md-12 mb-2">
        <div class="card border-left-primary shadow h-100 py-2">
            <div class="card-body">
                <form action="/AddServlet" method="post">
                    <div class="col-xl-12 col-md-12 mb-2">
                        <label for="username">Nazwa użytkownika</label>
                        <input name="username" type="text" id="username" class="form-control"
                               placeholder="Nazwa użytkownika">
                    </div>

                    <div class="col-xl-12 col-md-12 mb-2">
                        <label for="email">E-mail</label>
                        <input name="email" type="email" id="email" class="form-control"
                               placeholder="E-mail użytkownika">
                    </div>

                    <div class="col-xl-12 col-md-12 mb-2">
                        <label for="password">Hasło</label>
                        <input name="password" type="password" id="password" class="form-control" placeholder="Hasło">
                    </div>

                    <div class="col-xl-12 col-md-12 mb-2">
                        <button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
                                class="fas fa-address-card fa-sm text-white-50"></i> Dodaj użytkownika
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@ include file="/fragments/footer.jsp" %>
