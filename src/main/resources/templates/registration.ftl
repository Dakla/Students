<#import "parts/common.ftl" as c>

<@c.page>
<a href="/">Назад</a>
<form class="needs-validation" novalidate method="POST" action="/registration">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <div class="form-row">
        <div class="col-md-12 mb-3">
            <label for="name">Имя</label>
            <input type="text" class="form-control ${(nameError??)?string('is-invalid', '')}" id="regName" placeholder="Имя" name="name" value="<#if student??>${student.name}</#if>">
            <#if nameError??>
            <div class="invalid-feedback">
                ${nameError}
            </div>
            </#if>
        </div>
        <div class="col-md-12 mb-3">
            <label for="surname">Фамилия</label>
            <input type="text" class="form-control ${(surnameError??)?string('is-invalid', '')}" id="regSurname" placeholder="фамилия" name="surname" value="<#if student??>${student.surname}</#if>">
            <#if surnameError??>
            <div class="invalid-feedback">
                ${surnameError}
            </div>
            </#if>
        </div>
        <div class="col-md-12 mb-3">
            <label for="gNumber">Номер группы</label>
            <input type="text" class="form-control ${(gNumberError??)?string('is-invalid', '')}" id="regGroupNumber" placeholder="Номер группы" name="gNumber" value="<#if student??>${student.gNumber}</#if>">
            <#if gNumberError??>
            <div class="invalid-feedback">
                ${gNumberError}
            </div>
            </#if>
        </div>
        <div class="col-md-12 mb-3">
                <label>Пол</label>
                <div class="col-sm form-check-inline">
                    <div class="col-sm custom-control custom-radio">
                        <input type="radio" name="gender" class="form-check-input ${(genderError??)?string('is-invalid', '')}" <#if student??><#if (student.gender)??><#if student.gender=='m'>checked</#if></#if></#if> value="m" id="m">
                        <label for="m" class="form-check-label">Муж</label>
                    </div>
                    <div class="col-sm custom-control custom-radio">
                        <input type="radio" name="gender" class="form-check-input ${(genderError??)?string('is-invalid', '')}" <#if student??><#if (student.gender)??><#if student.gender=='f'>checked</#if></#if></#if> value="f" id="f">
                        <label for="f" class="form-check-label">Жен</label>
                    </div>
                    <#if genderError??>
                        <div class="invalid-feedback">
                            ${genderError}
                        </div>
                    </#if>
                </div>
        </div>
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
                <label for="regPoints">Число баллов ЕГЭ</label>
                <input type="number" class="form-control ${(pointsError??)?string('is-invalid', '')}" id="regPoints" placeholder="Баллы" name="points" value="<#if student??>${student.points}<#else>0</#if>">
                <#if pointsError??>
                    <div class="invalid-feedback">
                        ${pointsError}
                    </div>
                </#if>
        </div>
        <div class="col-md-12 mb-3">
                <label for="regBirth">Дата рождения</label>
                <input type="text" class="form-control ${(birthDayError??)?string('is-invalid', '')}" id="regBirth" placeholder="01/01/1991" name="birthDay" value="">
                <#if birthDayError??>
                    <div class="invalid-feedback">
                        ${birthDayError}
                    </div>
                </#if>
        </div>
        <div class="col-md-12 mb-3">
                <label>Местонахождение</label>
                <div class="col-sm form-check-inline">
                    <div class="col-sm custom-control custom-radio">
                        <input type="radio" name="place" class="form-check-input ${(placeError??)?string('is-invalid', '')}" value="regPlace01" id="regPlace01"
                            <#if student??>
                                <#if (student.place)??>
                                    <#if student.place=='regPlace01'>
                                        checked
                                    </#if>
                                </#if>
                            </#if>
                        >
                        <label for="regPlace01" class="form-check-label">Местный</label>
                    </div>
                    <div class="col-sm custom-control custom-radio">
                        <input type="radio" name="place" class="form-check-input ${(placeError??)?string('is-invalid', '')}" value="regPlace02" id="regPlace02" 
                            <#if student??>
                                <#if (student.place)??>
                                    <#if student.place=='regPlace02'>
                                        checked
                                    </#if>
                                </#if>
                            </#if>
                        >
                        <label for="regPlace02" class="form-check-label">Иногородний</label>
                    </div>
                    <#if placeError??>
                        <div class="invalid-feedback">
                            ${placeError}
                        </div>
                    </#if>
                </div>
        </div>
        <div class="col-md-12 mb-3">
                <label>Пароль</label>
                <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" placeholder="Пароль" name="password"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
        </div>
    </div>           
<button class="btn btn-primary col-12" type="submit">Регистрация</button>
<a href="/login">Уже зарегистрированы? Войти</a>
</form>
</@c.page>