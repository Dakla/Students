<#assign 
    know = Session.SPRING_SECURITY_CONTEXT??
>
<#if know>
    <#assign 
    student = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    name = student.getName()
    surname = student.getSurname()
    gNumber = student.getgNumber()
    points = student.getPoints()
    username = student.getUsername()
    birthDay = student.getBirthDay()
    gender = student.getGender()

    >
<#else/>
    <#assign
    name = "unknown"
    >
</#if>