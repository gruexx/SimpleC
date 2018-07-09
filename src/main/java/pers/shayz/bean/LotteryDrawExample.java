package pers.shayz.bean;

import java.util.ArrayList;
import java.util.List;

public class LotteryDrawExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public LotteryDrawExample() {
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

        public Criteria andLotteryDrawidIsNull() {
            addCriterion("lottery_drawid is null");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidIsNotNull() {
            addCriterion("lottery_drawid is not null");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidEqualTo(Integer value) {
            addCriterion("lottery_drawid =", value, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidNotEqualTo(Integer value) {
            addCriterion("lottery_drawid <>", value, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidGreaterThan(Integer value) {
            addCriterion("lottery_drawid >", value, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidGreaterThanOrEqualTo(Integer value) {
            addCriterion("lottery_drawid >=", value, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidLessThan(Integer value) {
            addCriterion("lottery_drawid <", value, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidLessThanOrEqualTo(Integer value) {
            addCriterion("lottery_drawid <=", value, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidIn(List<Integer> values) {
            addCriterion("lottery_drawid in", values, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidNotIn(List<Integer> values) {
            addCriterion("lottery_drawid not in", values, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidBetween(Integer value1, Integer value2) {
            addCriterion("lottery_drawid between", value1, value2, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawidNotBetween(Integer value1, Integer value2) {
            addCriterion("lottery_drawid not between", value1, value2, "lotteryDrawid");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawIsNull() {
            addCriterion("useridFklotter_draw is null");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawIsNotNull() {
            addCriterion("useridFklotter_draw is not null");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawEqualTo(Integer value) {
            addCriterion("useridFklotter_draw =", value, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawNotEqualTo(Integer value) {
            addCriterion("useridFklotter_draw <>", value, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawGreaterThan(Integer value) {
            addCriterion("useridFklotter_draw >", value, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawGreaterThanOrEqualTo(Integer value) {
            addCriterion("useridFklotter_draw >=", value, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawLessThan(Integer value) {
            addCriterion("useridFklotter_draw <", value, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawLessThanOrEqualTo(Integer value) {
            addCriterion("useridFklotter_draw <=", value, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawIn(List<Integer> values) {
            addCriterion("useridFklotter_draw in", values, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawNotIn(List<Integer> values) {
            addCriterion("useridFklotter_draw not in", values, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawBetween(Integer value1, Integer value2) {
            addCriterion("useridFklotter_draw between", value1, value2, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andUseridfklotterDrawNotBetween(Integer value1, Integer value2) {
            addCriterion("useridFklotter_draw not between", value1, value2, "useridfklotterDraw");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsIsNull() {
            addCriterion("lottery_drawdetils is null");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsIsNotNull() {
            addCriterion("lottery_drawdetils is not null");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsEqualTo(String value) {
            addCriterion("lottery_drawdetils =", value, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsNotEqualTo(String value) {
            addCriterion("lottery_drawdetils <>", value, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsGreaterThan(String value) {
            addCriterion("lottery_drawdetils >", value, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsGreaterThanOrEqualTo(String value) {
            addCriterion("lottery_drawdetils >=", value, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsLessThan(String value) {
            addCriterion("lottery_drawdetils <", value, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsLessThanOrEqualTo(String value) {
            addCriterion("lottery_drawdetils <=", value, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsLike(String value) {
            addCriterion("lottery_drawdetils like", value, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsNotLike(String value) {
            addCriterion("lottery_drawdetils not like", value, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsIn(List<String> values) {
            addCriterion("lottery_drawdetils in", values, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsNotIn(List<String> values) {
            addCriterion("lottery_drawdetils not in", values, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsBetween(String value1, String value2) {
            addCriterion("lottery_drawdetils between", value1, value2, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdetilsNotBetween(String value1, String value2) {
            addCriterion("lottery_drawdetils not between", value1, value2, "lotteryDrawdetils");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateIsNull() {
            addCriterion("lottery_drawdate is null");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateIsNotNull() {
            addCriterion("lottery_drawdate is not null");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateEqualTo(String value) {
            addCriterion("lottery_drawdate =", value, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateNotEqualTo(String value) {
            addCriterion("lottery_drawdate <>", value, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateGreaterThan(String value) {
            addCriterion("lottery_drawdate >", value, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateGreaterThanOrEqualTo(String value) {
            addCriterion("lottery_drawdate >=", value, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateLessThan(String value) {
            addCriterion("lottery_drawdate <", value, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateLessThanOrEqualTo(String value) {
            addCriterion("lottery_drawdate <=", value, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateLike(String value) {
            addCriterion("lottery_drawdate like", value, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateNotLike(String value) {
            addCriterion("lottery_drawdate not like", value, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateIn(List<String> values) {
            addCriterion("lottery_drawdate in", values, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateNotIn(List<String> values) {
            addCriterion("lottery_drawdate not in", values, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateBetween(String value1, String value2) {
            addCriterion("lottery_drawdate between", value1, value2, "lotteryDrawdate");
            return (Criteria) this;
        }

        public Criteria andLotteryDrawdateNotBetween(String value1, String value2) {
            addCriterion("lottery_drawdate not between", value1, value2, "lotteryDrawdate");
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