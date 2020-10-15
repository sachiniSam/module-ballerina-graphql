// Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/java;
import ballerina/reflect;

isolated function getHttpListenerConfigs(ListenerConfiguration configs) returns http:ListenerConfiguration {
    http:ListenerConfiguration httpConfigs = {
        host: configs.host
    };
    return httpConfigs;
}

isolated function handlePostRequests(Engine? engine, http:Request request) returns http:Response {
    http:Response response = new;
    string contentType = request.getContentType();
    if (contentType == CONTENT_TYPE_JSON) {
        processRequestWithJsonPayload(engine, request, response);
    } else if (contentType == CONTENT_TYPE_GQL) {
        json payload = getErrorJson("Content-Type 'application/graphql' is not yet supported");
        response.setPayload(payload);
    } else {
        json payload = getErrorJson("Invalid 'Content-type' received");
        response.setPayload(payload);
    }
    return response;
}

isolated function processRequestWithJsonPayload(Engine? engine, http:Request request, http:Response response) {
    var payload = request.getJsonPayload();
    if (payload is json) {
        return processJsonPayload(engine, payload, response);
    } else {
        string message = "Error occurred while retriving the payload from the request.";
        response.setJsonPayload(getErrorJson(message));
    }
}

isolated function processJsonPayload(Engine? engine, json payload, http:Response response) {
    var document = payload.query;
    var operationName = payload.operationName;
    if (document is string) {
        json? outputObject = ();
        if (engine is Engine) {
            outputObject = engine.validate(document);
        }
        response.setJsonPayload(outputObject);
    }
}

isolated function attach(Listener 'listener, service s, string? name) returns error? = @java:Method
{
    'class: "io.ballerina.stdlib.graphql.service.ServiceHandler"
} external;

isolated function detach(Listener 'listener, service s) returns error? = @java:Method
{
    'class: "io.ballerina.stdlib.graphql.service.ServiceHandler"
} external;

isolated function getServiceAnnotations(service s) returns GraphQlServiceConfiguration? {
    any annData = reflect:getServiceAnnotations(s, "ServiceConfiguration", "ballerina/graphql:0.1.0");
    if (!(annData is ())) {
        return <GraphQlServiceConfiguration> annData;
    }
}
