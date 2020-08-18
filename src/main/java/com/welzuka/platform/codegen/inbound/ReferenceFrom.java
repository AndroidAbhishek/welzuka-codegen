package com.welzuka.platform.codegen.inbound;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ReferenceFrom {

    @JsonProperty("From")
    String from;

    @JsonProperty("ReferenceKey")
    String referenceKey;

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public String getReferenceKey() {
        return referenceKey;
    }

    public void setReferenceKey(String referenceKey) {
        this.referenceKey = referenceKey;
    }
}
