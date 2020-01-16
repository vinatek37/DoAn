package com.vinatek.utils.utilities;

//import com.ecgo.api.response.data.doctor.VinmecRelatedArticles;
import com.vinatek.utils.utilities.entity.VinmecRelatedArticles;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.nio.charset.StandardCharsets.UTF_8;

public class JsonUtils {

    private ObjectMapper mapper;

    private static JsonUtils instance = new JsonUtils();

    public static synchronized JsonUtils getInstance() {
        if (instance == null) {
            instance = new JsonUtils();
        }
        return instance;
    }

    private JsonUtils() {
        mapper = new ObjectMapper();
        mapper.enable(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT);
        mapper.enable(DeserializationFeature.ACCEPT_EMPTY_ARRAY_AS_NULL_OBJECT);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
        mapper.getFactory().configure(JsonGenerator.Feature.ESCAPE_NON_ASCII, true);
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);        
    }
    
    public String toJSONString(Object object) {
        String jsonInString;
        try {
            jsonInString = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(object);
        } catch (JsonProcessingException ex) {
            return "";
        }
        return jsonInString;
    }

    public Object parseFromJSONByte(byte[] data, Class clazz) throws IOException {
        InputStreamReader inReader = new InputStreamReader(new ByteArrayInputStream(data), UTF_8);
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        return mapper.readValue(inReader, clazz);
    }
    
    public Object parseFromJSONString(String jsonString, Class clazz) throws IOException {
        InputStreamReader inReader = new InputStreamReader(new ByteArrayInputStream(jsonString.getBytes(StandardCharsets.UTF_8)), UTF_8);
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        return mapper.readValue(inReader, clazz);
    }
    
    public List<String> parserListStringFromJSONString(String jsonString) {
        try {
            return mapper.readValue(jsonString, new TypeReference<List<String>>(){});
        } catch (IOException ex) {
        }
        
        return new ArrayList<>();
    }
    
    public HashMap<String, Object> parserFromJSONString(String jsonString) throws IOException {
        return mapper.readValue(jsonString, new TypeReference<Map<String, Object>>() {
        });
    }

    public VinmecRelatedArticles[] parseFromJSONArrayString(String jsonArrayString) throws IOException {
        InputStreamReader inReader = new InputStreamReader(new ByteArrayInputStream(jsonArrayString.getBytes(StandardCharsets.UTF_8)), UTF_8);
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        return (VinmecRelatedArticles[]) mapper.readValue(inReader, VinmecRelatedArticles[].class);
    }
}
