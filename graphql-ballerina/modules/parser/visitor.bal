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

public type Visitor object {
    public isolated function visitDocument(DocumentNode documentNode) returns anydata;
    public isolated function visitOperation(OperationNode operationNode) returns anydata;
    public isolated function visitField(FieldNode fieldNode, anydata data = ()) returns anydata;
    public isolated function visitArgument(ArgumentNode argumentNode, anydata data = ()) returns anydata;
};
