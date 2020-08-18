package com.welzuka.platform.codegen.converter;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.util.Iterator;

public class JSONConverter {

    public static JsonNode convertJsonFormat(JSONObject json) {
        ObjectNode ret = JsonNodeFactory.instance.objectNode();

        @SuppressWarnings("unchecked")
        Iterator<String> iterator = json.keySet().iterator();
        for (; iterator.hasNext();) {
            String key = iterator.next();
            Object value;
            try {
                value = json.get(key);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            if (null==json.get(key))
                ret.putNull(key);
            else if (value instanceof String)
                ret.put(key, (String) value);
            else if (value instanceof Integer)
                ret.put(key, (Integer) value);
            else if (value instanceof Long)
                ret.put(key, (Long) value);
            else if (value instanceof Double)
                ret.put(key, (Double) value);
            else if (value instanceof Boolean)
                ret.put(key, (Boolean) value);
            else if (value instanceof JSONObject)
                ret.put(key, convertJsonFormat((JSONObject) value));
            else if (value instanceof JSONArray)
                ret.put(key, convertJsonFormat((JSONArray) value));
            else
                throw new RuntimeException("not prepared for converting instance of class " + value.getClass());
        }
        return ret;
    }

    public static JsonNode convertJsonFormat(JSONArray json) {
        ArrayNode ret = JsonNodeFactory.instance.arrayNode();
        for (int i = 0; i < json.size(); i++) {
            Object value;
            try {
                value = json.get(i);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            if (null==json.get(i))
                ret.addNull();
            else if (value instanceof String)
                ret.add((String) value);
            else if (value instanceof Integer)
                ret.add((Integer) value);
            else if (value instanceof Long)
                ret.add((Long) value);
            else if (value instanceof Double)
                ret.add((Double) value);
            else if (value instanceof Boolean)
                ret.add((Boolean) value);
            else if (value instanceof JSONObject)
                ret.add(convertJsonFormat((JSONObject) value));
            else if (value instanceof JSONArray)
                ret.add(convertJsonFormat((JSONArray) value));
            else
                throw new RuntimeException("not prepared for converting instance of class " + value.getClass());
        }
        return ret;
    }
}
