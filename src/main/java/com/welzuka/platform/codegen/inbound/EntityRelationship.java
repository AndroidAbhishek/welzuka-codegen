package com.welzuka.platform.codegen.inbound;

public class EntityRelationship {

    boolean isFromEntity;

    boolean isToEntity;

    boolean isParentChildRelation;

    String foreignKey;

    public boolean isFromEntity() {
        return isFromEntity;
    }

    public void setFromEntity(boolean fromEntity) {
        isFromEntity = fromEntity;
    }

    public boolean isToEntity() {
        return isToEntity;
    }

    public void setToEntity(boolean toEntity) {
        isToEntity = toEntity;
    }

    public boolean isParentChildRelation() {
        return isParentChildRelation;
    }

    public void setParentChildRelation(boolean parentChildRelation) {
        isParentChildRelation = parentChildRelation;
    }

    public String getForeignKey() {
        return foreignKey;
    }

    public void setForeignKey(String foreignKey) {
        this.foreignKey = foreignKey;
    }
}
