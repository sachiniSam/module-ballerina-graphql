/*
 * Copyright (c) 2022, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package io.ballerina.stdlib.graphql.compiler.schema.types;

/**
 * Stores descriptions for the default types in a GraphQL schema.
 */
public enum Description {
    STRING("The `String` scalar type represents textual data, represented as UTF-8 character sequences. The String " +
                   "type is most often used by GraphQL to represent free-form human-readable text."),
    INT("The `Int` scalar type represents non-fractional signed whole numeric values."),
    FLOAT("The `Float` scalar type represents signed double-precision fractional values as specified by [IEEE 754]" +
                  "(https://en.wikipedia.org/wiki/IEEE_floating_point)."),
    BOOLEAN("The `Boolean` scalar type represents `true` or `false`."),
    DECIMAL("The decimal type corresponds to a subset of IEEE 754-2008 128-bit decimal (radix 10) floating point " +
                    "numbers"),
    GENERATED_UNION_TYPE("auto-generated union type from Ballerina"),
    TYPE("The fundamental unit of any GraphQL Schema is the type. There are many kinds of types in GraphQL as " +
                 "represented by the `__TypeKind` enum.\n\nDepending on the kind of type, certain fields describe" +
                 " information about that type. Scalar types provide no information beyond a name, description and " +
                 "optional `specifiedByUrl`, while Enum types provide their values. Object and Interface types " +
                 "provide the fields they describe. Abstract types, Union and Interface, provide the Object types " +
                 "possible at runtime. List and NonNull types compose other types."),
    SCHEMA("A GraphQL Schema defines the capabilities of a GraphQL server. It exposes all available types and " +
                   "directives on the server, as well as the entry points for query, mutation, and subscription " +
                   "operations."),
    FIELD("Object and Interface types are described by a list of Fields, each of which has a name, potentially a list" +
                  " of arguments, and a return type."),
    INPUT_VALUE(
            "Arguments provided to Fields or Directives and the input fields of an InputObject are represented as " +
                    "Input Values which describe their type and optionally a default value."),
    ENUM_VALUE(
            "One possible value for a given Enum. Enum values are unique values, not a placeholder for a string or " +
                    "numeric value. However an Enum value is returned in a JSON response as a string."),
    TYPE_KIND("An enum describing what kind of type a given `__Type` is."),
    DIRECTIVE(
            "A Directive provides a way to describe alternate runtime execution and type validation behavior in a " +
                    "GraphQL document.\n\nIn some cases, you need to provide options to alter GraphQL's execution " +
                    "behavior in ways field arguments will not suffice, such as conditionally including or skipping a" +
                    " field. Directives provide this by describing additional information to the executor."),
    DIRECTIVE_LOCATION(
            "A Directive can be adjacent to many parts of the GraphQL language, a __DirectiveLocation describes one " +
                    "such possible adjacencies.");

    private final String description;

    Description(String description) {
        this.description = description;
    }

    public String getDescription() {
        return this.description;
    }
}
