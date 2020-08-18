package com.welzuka.platform.codegen.reader;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.MapperFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.TreeTraversingParser;
import com.welzuka.platform.codegen.constant.Constant;
import com.welzuka.platform.codegen.converter.JSONConverter;
import com.welzuka.platform.codegen.inbound.Component;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class ComponentJSONParser {

    public JSONObject readJsonFile(){
        String jsonData = readFile("component/Component.json");
        JSONParser jsonParser = new JSONParser();
        JSONObject json = null;
        try {
            json = (JSONObject) jsonParser.parse(jsonData);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return json;
    }

    public String readFile(String filename) {
        String result = "";
        try {
            ClassLoader classloader = Thread.currentThread().getContextClassLoader();
            InputStream is = classloader.getResourceAsStream(filename);
            BufferedReader br = new BufferedReader(new InputStreamReader(is));
            StringBuilder sb = new StringBuilder();
            String line = br.readLine();
            while (line != null) {
                sb.append(line);
                line = br.readLine();
            }
            result = sb.toString();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public Component parseJson(JSONObject jsonObject){
        Component component = null;
        JsonNode jsonNode = JSONConverter.convertJsonFormat(jsonObject);
        ObjectMapper mapper = new ObjectMapper();
        try {
            component = mapper.readValue(new TreeTraversingParser(jsonNode), Component.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return component;
    }
}
