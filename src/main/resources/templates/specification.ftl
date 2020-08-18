package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.specification;

import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.domain.${entity.entityName};
import com.welzuka.service.SearchCriterion;
import org.springframework.data.jpa.domain.Specification;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import java.util.Date;
import javax.persistence.criteria.Root;

public class ${entity.entityName}Specification implements Specification<${entity.entityName}> {

    private SearchCriterion criteria;

    public ${entity.entityName}Specification(SearchCriterion criterion){
        this.criteria = criterion;
    }

    @Override
    public Predicate toPredicate(Root<${entity.entityName}> root, CriteriaQuery<?> query, CriteriaBuilder builder) {
        if (criteria.getOperation().equalsIgnoreCase(">")) {
            return builder.greaterThanOrEqualTo(
                    root.<String> get(criteria.getKey()), criteria.getValue().toString());
        }
        else if (criteria.getOperation().equalsIgnoreCase("<")) {
            return builder.lessThanOrEqualTo(
                    root.<String> get(criteria.getKey()), criteria.getValue().toString());
        }
        else if (criteria.getOperation().equalsIgnoreCase("=")) {
            if (root.get(criteria.getKey()).getJavaType() == String.class) {
                return builder.like(
                        root.<String>get(criteria.getKey()), "%" + criteria.getValue() + "%");
            } else {
                return builder.equal(root.get(criteria.getKey()), criteria.getValue());
            }
        }
        return null;
    }
}
