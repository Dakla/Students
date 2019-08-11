<#import "parts/common.ftl" as c>
<@c.page>
<#if message??>
<div class="alert alert-success" role="alert">
    Данные успешно обновлены!
</div>
</#if>
<div class="mt-3">
    <a href="/">Назад</a>
</div>
<form class="needs-validation" novalidate method="POST" action="/edit">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <div class="form-row">
        <div class="col-md-12 mb-3">
            <label for="name">Имя</label>
            <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}" id="name" placeholder="${name}" name="name">
            <#if usernameError??>
            <div class="invalid-feedback">
                ${usernameError}
            </div>
            </#if>
        </div>
        <div class="col-md-12 mb-3">
            <label for="surname">Фамилия</label>
            <input type="text" class="form-control" id="surname" placeholder="${surname}" name="surname">
        </div>
        <div class="col-md-12 mb-3">
            <label for="gNumber">Номер группы</label>
            <input type="text" class="form-control" id="gNumber" placeholder="${gNumber}" name="gNumber">
        </div>
        <div class="col-md-12 mb-3">
                <label>Пол</label>
                <div class="col-sm form-check-inline">
                    <div class="col-sm custom-control custom-radio">
                        <input type="radio" name="gender" class="form-check-input" <#if gender=='m'>checked</#if> value="m" id="m">
                        <label for="m" class="form-check-label">Муж</label>
                    </div>
                    <div class="col-sm custom-control custom-radio">
                        <input type="radio" name="gender" class="form-check-input" <#if gender=='f'>checked</#if>value="f" id="f">
                        <label for="f" class="form-check-label">Жен</label>
                    </div>
                </div>
        </div>
        <div class="col-md-12 mb-3">
            <label for="username">Email</label>
            <input type="text" class="form-control" id="username" placeholder="${email}" name="username">
        </div>
        <div class="col-md-12 mb-3">
                <label for="regPoints">Число баллов ЕГЭ</label>
                <input type="number" class="form-control" id="points" placeholder="${points}" name="points">
        </div>
        <div class="col-md-12 mb-3">
                <label for="regBirth">Дата рождения</label>
                <input type="text" class="form-control" id="birthDay" placeholder="${birthDay}" name="birthDay">
        </div>
        <div class="col-md-12 mb-3">
                <label>Местонахождение</label>
                <div class="col-sm form-check-inline">
                    <div class="col-sm custom-control custom-radio">
                        <input type="radio" name="place" class="form-check-input" value="regPlace01" id="regPlace01" <#if place=='regPlace01'>checked</#if>>
                        <label for="regPlace01" class="form-check-label">Местный</label>
                    </div>
                    <div class="col-sm custom-control custom-radio">
                        <input type="radio" name="place" class="form-check-input" value="regPlace02" id="regPlace02" <#if place=='regPlace02'>checked</#if>>
                        <label for="regPlace02" class="form-check-label">Иногородний</label>
                    </div>
                </div>
        </div>
        <div class="col-md-12 mb-3">
                <label>Пароль</label>
                <input type="password" class="form-control" placeholder="Пароль" name="password"/>
        </div>
    </div>           
<button class="btn btn-primary col-12" type="submit">Сохранить</button>
</form>
</@c.page>