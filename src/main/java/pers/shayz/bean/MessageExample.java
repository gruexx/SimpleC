package pers.shayz.bean;

import java.util.ArrayList;
import java.util.List;

public class MessageExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public MessageExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andSendname1IsNull() {
            addCriterion("sendname1 is null");
            return (Criteria) this;
        }

        public Criteria andSendname1IsNotNull() {
            addCriterion("sendname1 is not null");
            return (Criteria) this;
        }

        public Criteria andSendname1EqualTo(String value) {
            addCriterion("sendname1 =", value, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1NotEqualTo(String value) {
            addCriterion("sendname1 <>", value, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1GreaterThan(String value) {
            addCriterion("sendname1 >", value, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1GreaterThanOrEqualTo(String value) {
            addCriterion("sendname1 >=", value, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1LessThan(String value) {
            addCriterion("sendname1 <", value, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1LessThanOrEqualTo(String value) {
            addCriterion("sendname1 <=", value, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1Like(String value) {
            addCriterion("sendname1 like", value, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1NotLike(String value) {
            addCriterion("sendname1 not like", value, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1In(List<String> values) {
            addCriterion("sendname1 in", values, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1NotIn(List<String> values) {
            addCriterion("sendname1 not in", values, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1Between(String value1, String value2) {
            addCriterion("sendname1 between", value1, value2, "sendname1");
            return (Criteria) this;
        }

        public Criteria andSendname1NotBetween(String value1, String value2) {
            addCriterion("sendname1 not between", value1, value2, "sendname1");
            return (Criteria) this;
        }

        public Criteria andRecivername2IsNull() {
            addCriterion("recivername2 is null");
            return (Criteria) this;
        }

        public Criteria andRecivername2IsNotNull() {
            addCriterion("recivername2 is not null");
            return (Criteria) this;
        }

        public Criteria andRecivername2EqualTo(String value) {
            addCriterion("recivername2 =", value, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2NotEqualTo(String value) {
            addCriterion("recivername2 <>", value, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2GreaterThan(String value) {
            addCriterion("recivername2 >", value, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2GreaterThanOrEqualTo(String value) {
            addCriterion("recivername2 >=", value, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2LessThan(String value) {
            addCriterion("recivername2 <", value, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2LessThanOrEqualTo(String value) {
            addCriterion("recivername2 <=", value, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2Like(String value) {
            addCriterion("recivername2 like", value, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2NotLike(String value) {
            addCriterion("recivername2 not like", value, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2In(List<String> values) {
            addCriterion("recivername2 in", values, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2NotIn(List<String> values) {
            addCriterion("recivername2 not in", values, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2Between(String value1, String value2) {
            addCriterion("recivername2 between", value1, value2, "recivername2");
            return (Criteria) this;
        }

        public Criteria andRecivername2NotBetween(String value1, String value2) {
            addCriterion("recivername2 not between", value1, value2, "recivername2");
            return (Criteria) this;
        }

        public Criteria andMessageIsNull() {
            addCriterion("message is null");
            return (Criteria) this;
        }

        public Criteria andMessageIsNotNull() {
            addCriterion("message is not null");
            return (Criteria) this;
        }

        public Criteria andMessageEqualTo(String value) {
            addCriterion("message =", value, "message");
            return (Criteria) this;
        }

        public Criteria andMessageNotEqualTo(String value) {
            addCriterion("message <>", value, "message");
            return (Criteria) this;
        }

        public Criteria andMessageGreaterThan(String value) {
            addCriterion("message >", value, "message");
            return (Criteria) this;
        }

        public Criteria andMessageGreaterThanOrEqualTo(String value) {
            addCriterion("message >=", value, "message");
            return (Criteria) this;
        }

        public Criteria andMessageLessThan(String value) {
            addCriterion("message <", value, "message");
            return (Criteria) this;
        }

        public Criteria andMessageLessThanOrEqualTo(String value) {
            addCriterion("message <=", value, "message");
            return (Criteria) this;
        }

        public Criteria andMessageLike(String value) {
            addCriterion("message like", value, "message");
            return (Criteria) this;
        }

        public Criteria andMessageNotLike(String value) {
            addCriterion("message not like", value, "message");
            return (Criteria) this;
        }

        public Criteria andMessageIn(List<String> values) {
            addCriterion("message in", values, "message");
            return (Criteria) this;
        }

        public Criteria andMessageNotIn(List<String> values) {
            addCriterion("message not in", values, "message");
            return (Criteria) this;
        }

        public Criteria andMessageBetween(String value1, String value2) {
            addCriterion("message between", value1, value2, "message");
            return (Criteria) this;
        }

        public Criteria andMessageNotBetween(String value1, String value2) {
            addCriterion("message not between", value1, value2, "message");
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