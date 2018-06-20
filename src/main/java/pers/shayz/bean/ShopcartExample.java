package pers.shayz.bean;

import java.util.ArrayList;
import java.util.List;

public class ShopcartExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ShopcartExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andShopcartidIsNull() {
            addCriterion("shopcartId is null");
            return (Criteria) this;
        }

        public Criteria andShopcartidIsNotNull() {
            addCriterion("shopcartId is not null");
            return (Criteria) this;
        }

        public Criteria andShopcartidEqualTo(Integer value) {
            addCriterion("shopcartId =", value, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andShopcartidNotEqualTo(Integer value) {
            addCriterion("shopcartId <>", value, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andShopcartidGreaterThan(Integer value) {
            addCriterion("shopcartId >", value, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andShopcartidGreaterThanOrEqualTo(Integer value) {
            addCriterion("shopcartId >=", value, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andShopcartidLessThan(Integer value) {
            addCriterion("shopcartId <", value, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andShopcartidLessThanOrEqualTo(Integer value) {
            addCriterion("shopcartId <=", value, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andShopcartidIn(List<Integer> values) {
            addCriterion("shopcartId in", values, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andShopcartidNotIn(List<Integer> values) {
            addCriterion("shopcartId not in", values, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andShopcartidBetween(Integer value1, Integer value2) {
            addCriterion("shopcartId between", value1, value2, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andShopcartidNotBetween(Integer value1, Integer value2) {
            addCriterion("shopcartId not between", value1, value2, "shopcartid");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartIsNull() {
            addCriterion("userId_fk_shopcart is null");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartIsNotNull() {
            addCriterion("userId_fk_shopcart is not null");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartEqualTo(Integer value) {
            addCriterion("userId_fk_shopcart =", value, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartNotEqualTo(Integer value) {
            addCriterion("userId_fk_shopcart <>", value, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartGreaterThan(Integer value) {
            addCriterion("userId_fk_shopcart >", value, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartGreaterThanOrEqualTo(Integer value) {
            addCriterion("userId_fk_shopcart >=", value, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartLessThan(Integer value) {
            addCriterion("userId_fk_shopcart <", value, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartLessThanOrEqualTo(Integer value) {
            addCriterion("userId_fk_shopcart <=", value, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartIn(List<Integer> values) {
            addCriterion("userId_fk_shopcart in", values, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartNotIn(List<Integer> values) {
            addCriterion("userId_fk_shopcart not in", values, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartBetween(Integer value1, Integer value2) {
            addCriterion("userId_fk_shopcart between", value1, value2, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andUseridFkShopcartNotBetween(Integer value1, Integer value2) {
            addCriterion("userId_fk_shopcart not between", value1, value2, "useridFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartIsNull() {
            addCriterion("goodsId_fk_shopcart is null");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartIsNotNull() {
            addCriterion("goodsId_fk_shopcart is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartEqualTo(Integer value) {
            addCriterion("goodsId_fk_shopcart =", value, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartNotEqualTo(Integer value) {
            addCriterion("goodsId_fk_shopcart <>", value, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartGreaterThan(Integer value) {
            addCriterion("goodsId_fk_shopcart >", value, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartGreaterThanOrEqualTo(Integer value) {
            addCriterion("goodsId_fk_shopcart >=", value, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartLessThan(Integer value) {
            addCriterion("goodsId_fk_shopcart <", value, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartLessThanOrEqualTo(Integer value) {
            addCriterion("goodsId_fk_shopcart <=", value, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartIn(List<Integer> values) {
            addCriterion("goodsId_fk_shopcart in", values, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartNotIn(List<Integer> values) {
            addCriterion("goodsId_fk_shopcart not in", values, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartBetween(Integer value1, Integer value2) {
            addCriterion("goodsId_fk_shopcart between", value1, value2, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andGoodsidFkShopcartNotBetween(Integer value1, Integer value2) {
            addCriterion("goodsId_fk_shopcart not between", value1, value2, "goodsidFkShopcart");
            return (Criteria) this;
        }

        public Criteria andNumberIsNull() {
            addCriterion("number is null");
            return (Criteria) this;
        }

        public Criteria andNumberIsNotNull() {
            addCriterion("number is not null");
            return (Criteria) this;
        }

        public Criteria andNumberEqualTo(Integer value) {
            addCriterion("number =", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberNotEqualTo(Integer value) {
            addCriterion("number <>", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberGreaterThan(Integer value) {
            addCriterion("number >", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("number >=", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberLessThan(Integer value) {
            addCriterion("number <", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberLessThanOrEqualTo(Integer value) {
            addCriterion("number <=", value, "number");
            return (Criteria) this;
        }

        public Criteria andNumberIn(List<Integer> values) {
            addCriterion("number in", values, "number");
            return (Criteria) this;
        }

        public Criteria andNumberNotIn(List<Integer> values) {
            addCriterion("number not in", values, "number");
            return (Criteria) this;
        }

        public Criteria andNumberBetween(Integer value1, Integer value2) {
            addCriterion("number between", value1, value2, "number");
            return (Criteria) this;
        }

        public Criteria andNumberNotBetween(Integer value1, Integer value2) {
            addCriterion("number not between", value1, value2, "number");
            return (Criteria) this;
        }

        public Criteria andIsbuyIsNull() {
            addCriterion("isBuy is null");
            return (Criteria) this;
        }

        public Criteria andIsbuyIsNotNull() {
            addCriterion("isBuy is not null");
            return (Criteria) this;
        }

        public Criteria andIsbuyEqualTo(Integer value) {
            addCriterion("isBuy =", value, "isbuy");
            return (Criteria) this;
        }

        public Criteria andIsbuyNotEqualTo(Integer value) {
            addCriterion("isBuy <>", value, "isbuy");
            return (Criteria) this;
        }

        public Criteria andIsbuyGreaterThan(Integer value) {
            addCriterion("isBuy >", value, "isbuy");
            return (Criteria) this;
        }

        public Criteria andIsbuyGreaterThanOrEqualTo(Integer value) {
            addCriterion("isBuy >=", value, "isbuy");
            return (Criteria) this;
        }

        public Criteria andIsbuyLessThan(Integer value) {
            addCriterion("isBuy <", value, "isbuy");
            return (Criteria) this;
        }

        public Criteria andIsbuyLessThanOrEqualTo(Integer value) {
            addCriterion("isBuy <=", value, "isbuy");
            return (Criteria) this;
        }

        public Criteria andIsbuyIn(List<Integer> values) {
            addCriterion("isBuy in", values, "isbuy");
            return (Criteria) this;
        }

        public Criteria andIsbuyNotIn(List<Integer> values) {
            addCriterion("isBuy not in", values, "isbuy");
            return (Criteria) this;
        }

        public Criteria andIsbuyBetween(Integer value1, Integer value2) {
            addCriterion("isBuy between", value1, value2, "isbuy");
            return (Criteria) this;
        }

        public Criteria andIsbuyNotBetween(Integer value1, Integer value2) {
            addCriterion("isBuy not between", value1, value2, "isbuy");
            return (Criteria) this;
        }

        public Criteria andFlagIsNull() {
            addCriterion("flag is null");
            return (Criteria) this;
        }

        public Criteria andFlagIsNotNull() {
            addCriterion("flag is not null");
            return (Criteria) this;
        }

        public Criteria andFlagEqualTo(Integer value) {
            addCriterion("flag =", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotEqualTo(Integer value) {
            addCriterion("flag <>", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagGreaterThan(Integer value) {
            addCriterion("flag >", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagGreaterThanOrEqualTo(Integer value) {
            addCriterion("flag >=", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagLessThan(Integer value) {
            addCriterion("flag <", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagLessThanOrEqualTo(Integer value) {
            addCriterion("flag <=", value, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagIn(List<Integer> values) {
            addCriterion("flag in", values, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotIn(List<Integer> values) {
            addCriterion("flag not in", values, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagBetween(Integer value1, Integer value2) {
            addCriterion("flag between", value1, value2, "flag");
            return (Criteria) this;
        }

        public Criteria andFlagNotBetween(Integer value1, Integer value2) {
            addCriterion("flag not between", value1, value2, "flag");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}