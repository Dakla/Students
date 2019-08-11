<#import "parts/common.ftl" as c>

<@c.page>
<#if message??>
<div class="alert alert-success" role="alert">
    Данные успешно обновлены!
</div>
</#if>
<#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
    <div class="alert alert-danger" role="alert">
        Неправильные логин или пароль
    </div>
</#if>
<form class="needs-validation" method="POST" action="/login">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div class="col-md-12 mb-3">
            <label for="username">Email</label>
            <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}" id="username" placeholder="Email" name="username" value="<#if student??>${student.username}</#if>">
            <#if usernameError??>
            <div class="invalid-feedback">
                ${usernameError}
            </div>
            </#if>
        </div>
        <div class="col-md-12 mb-3">
                <label for="pswrd">Пароль</label>
                <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" id="pswrd" placeholder="Пароль" name="password">
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
        </div>         
        <button class="btn btn-primary col-12" type="submit">Вход</button>
</form>
</@c.page>