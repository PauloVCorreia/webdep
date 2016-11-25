<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="lang" scope="session" value="${not empty param.lang ? param.lang : not empty lang ? lang : pageContext.request.locale}"/>
<fmt:setLocale value="${ lang }"/>
<fmt:setBundle basename="Messages" />
<html>
<head>
    <title>WebDep</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
</head>
<body>
<div class="col-lg-8">
    <form action="FrontControllerServlet">
        <fieldset class="form-group">
            <legend><fmt:message key="br.cefetrj.psw.excluirLog.sistema" /></legend>
            <label><fmt:message key="br.cefetrj.psw.excluirLog.dataInicial" />:</label><input type="date" name="dataInicial" value="${ dataInicial }">
            <label><fmt:message key="br.cefetrj.psw.excluirLog.dataFinal" />:</label><input type="date" name="dataFinal" value="${ dataFinal }">
            <br>
            <c:if test="${ not empty dataInvalida and not dataInvalida }">
                <fmt:message key="br.cefetrj.psw.excluirLog.dataInvalida" />
            </c:if>
            <br>
            <label><fmt:message key="br.cefetrj.psw.excluirLog.horaInicial" />:</label><input type="time" name="horaInicial" value="${ horaInicial }">
            <label><fmt:message key="br.cefetrj.psw.excluirLog.horaFinal" />:</label><input type="time" name="horaFinal" value="${ horaFinal }">
            <br>
            <c:if test="${ not empty horaInvalida and not horaInvalida }">
                <fmt:message key="br.cefetrj.psw.excluirLog.horaInvalida" />
            </c:if>
            <br>
            <input type="text" name="buscarLog">
            <button type="submit" class="btn btn-primary btn-sm" name="action" value="buscarLogAcesso">
                <fmt:message key="br.cefetrj.psw.excluirLog.buscar" />
            </button>
        </fieldset>
        <br>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th> </th>
                    <th>IP</th>
                    <th><fmt:message key="br.cefetrj.psw.excluirLog.usuario" /></th>
                    <th><fmt:message key="br.cefetrj.psw.excluirLog.dataHora" /></th>
                    <th>URL</th>
                    <th><fmt:message key="br.cefetrj.psw.excluirLog.codigo" /></th>
                    <th><fmt:message key="br.cefetrj.psw.excluirLog.bytesTransferidos" /></th>
                    <th><fmt:message key="br.cefetrj.psw.excluirLog.origem" /></th>
                    <th><fmt:message key="br.cefetrj.psw.excluirLog.agente" /></th>
                </tr>
            </thead>
            <c:forEach items="${ listaLog }" var="log">
                <tr>
                    <td><input type="checkbox" class="checkbox-inline" name="idLog" value="${ log.getId() }"></td>
                    <td>${ log.getIp() }</td>
                    <td>${ log.getUsuario() }</td>
                    <td>${ log.getTimestamp().toString() }</td>
                    <td>${ log.getUrl() }</td>
                    <td>${ log.getCodigo() }</td>
                    <td>${ log.getBytes() }</td>
                    <td>${ log.getOrigem() }</td>
                    <td>${ log.getAgente() }</td>
                </tr>
            </c:forEach>
            <c:if test="${ not empty naoEncontrado and not naoEncontrado }">
                <fmt:message key="br.cefetrj.psw.excluirLog.naoEncontrado" />
            </c:if>
        </table>
        <br>
        <c:if test="${ not empty excluido and not excluido }">
            ${ excluido } <fmt:message key="br.cefetrj.psw.excluirLog.logsExcluidos" />
        </c:if>
        <br>
        <button type="submit" class="btn btn-primary btn-sm" name="action" value="excluirLogAcesso">
            <fmt:message key="br.cefetrj.psw.excluirLog.excluir" />
        </button>
        <input type="submit" class="btn btn-primary btn-sm" value="Voltar" onclick="history.back();">
    </form>
</div>
</body>
</html>
