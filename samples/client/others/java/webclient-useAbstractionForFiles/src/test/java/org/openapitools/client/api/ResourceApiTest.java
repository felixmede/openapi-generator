/*
 * Response file abstraction test
 * No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


package org.openapitools.client.api;

import java.io.File;
import org.junit.Test;
import org.junit.Ignore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * API tests for ResourceApi
 */
@Ignore
public class ResourceApiTest {

    private final ResourceApi api = new ResourceApi();

    
    /**
     * 
     *
     * Response file abstraction
     */
    @Test
    public void resourceInResponseTest()  {
        org.springframework.core.io.Resource response = api.resourceInResponse().block();

        // TODO: test validations
    }
    
}
