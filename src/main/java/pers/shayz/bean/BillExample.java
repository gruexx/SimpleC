package pers.shayz.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BillExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BillExample() {
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

        public Criteria andBillidIsNull() {
            addCriterion("billId is null");
            return (Criteria) this;
        }

        public Criteria andBillidIsNotNull() {
            addCriterion("billId is not null");
            return (Criteria) this;
        }

        public Criteria andBillidEqualTo(Integer value) {
            addCriterion("billId =", value, "billid");
            return (Criteria) this;
        }

        public Criteria andBillidNotEqualTo(Integer value) {
            addCriterion("billId <>", value, "billid");
            return (Criteria) this;
        }

        public Criteria andBillidGreaterThan(Integer value) {
            addCriterion("billId >", value, "billid");
            return (Criteria) this;
        }

        public Criteria andBillidGreaterThanOrEqualTo(Integer value) {
            addCriterion("billId >=", value, "billid");
            return (Criteria) this;
        }

        public Criteria andBillidLessThan(Integer value) {
            addCriterion("billId <", value, "billid");
            return (Criteria) this;
        }

        public Criteria andBillidLessThanOrEqualTo(Integer value) {
            addCriterion("billId <=", value, "billid");
            return (Criteria) this;
        }

        public Criteria andBillidIn(List<Integer> values) {
            addCriterion("billId in", values, "billid");
            return (Criteria) this;
        }

        public Criteria andBillidNotIn(List<Integer> values) {
            addCriterion("billId not in", values, "billid");
            return (Criteria) this;
        }

        public Criteria andBillidBetween(Integer value1, Integer value2) {
            addCriterion("billId between", value1, value2, "billid");
            return (Criteria) this;
        }

        public Criteria andBillidNotBetween(Integer value1, Integer value2) {
            addCriterion("billId not between", value1, value2, "billid");
            return (Criteria) this;
        }

        public Criteria andIncomeIsNull() {
            addCriterion("income is null");
            return (Criteria) this;
        }

        public Criteria andIncomeIsNotNull() {
            addCriterion("income is not null");
            return (Criteria) this;
        }

        public Criteria andIncomeEqualTo(Double value) {
            addCriterion("income =", value, "income");
            return (Criteria) this;
        }

        public Criteria andIncomeNotEqualTo(Double value) {
            addCriterion("income <>", value, "income");
            return (Criteria) this;
        }

        public Criteria andIncomeGreaterThan(Double value) {
            addCriterion("income >", value, "income");
            return (Criteria) this;
        }

        public Criteria andIncomeGreaterThanOrEqualTo(Double value) {
            addCriterion("income >=", value, "income");
            return (Criteria) this;
        }

        public Criteria andIncomeLessThan(Double value) {
            addCriterion("income <", value, "income");
            return (Criteria) this;
        }

        public Criteria andIncomeLessThanOrEqualTo(Double value) {
            addCriterion("income <=", value, "income");
            return (Criteria) this;
        }

        public Criteria andIncomeIn(List<Double> values) {
            addCriterion("income in", values, "income");
            return (Criteria) this;
        }

        public Criteria andIncomeNotIn(List<Double> values) {
            addCriterion("income not in", values, "income");
            return (Criteria) this;
        }

        public Criteria andIncomeBetween(Double value1, Double value2) {
            addCriterion("income between", value1, value2, "income");
            return (Criteria) this;
        }

        public Criteria andIncomeNotBetween(Double value1, Double value2) {
            addCriterion("income not between", value1, value2, "income");
            return (Criteria) this;
        }

        public Criteria andOutcomeIsNull() {
            addCriterion("outcome is null");
            return (Criteria) this;
        }

        public Criteria andOutcomeIsNotNull() {
            addCriterion("outcome is not null");
            return (Criteria) this;
        }

        public Criteria andOutcomeEqualTo(Double value) {
            addCriterion("outcome =", value, "outcome");
            return (Criteria) this;
        }

        public Criteria andOutcomeNotEqualTo(Double value) {
            addCriterion("outcome <>", value, "outcome");
            return (Criteria) this;
        }

        public Criteria andOutcomeGreaterThan(Double value) {
            addCriterion("outcome >", value, "outcome");
            return (Criteria) this;
        }

        public Criteria andOutcomeGreaterThanOrEqualTo(Double value) {
            addCriterion("outcome >=", value, "outcome");
            return (Criteria) this;
        }

        public Criteria andOutcomeLessThan(Double value) {
            addCriterion("outcome <", value, "outcome");
            return (Criteria) this;
        }

        public Criteria andOutcomeLessThanOrEqualTo(Double value) {
            addCriterion("outcome <=", value, "outcome");
            return (Criteria) this;
        }

        public Criteria andOutcomeIn(List<Double> values) {
            addCriterion("outcome in", values, "outcome");
            return (Criteria) this;
        }

        public Criteria andOutcomeNotIn(List<Double> values) {
            addCriterion("outcome not in", values, "outcome");
            return (Criteria) this;
        }

        public Criteria andOutcomeBetween(Double value1, Double value2) {
            addCriterion("outcome between", value1, value2, "outcome");
            return (Criteria) this;
        }

        public Criteria andOutcomeNotBetween(Double value1, Double value2) {
            addCriterion("outcome not between", value1, value2, "outcome");
            return (Criteria) this;
        }

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(Date value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(Date value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(Date value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(Date value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(Date value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(Date value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<Date> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<Date> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(Date value1, Date value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(Date value1, Date value2) {
            addCriterion("date not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillIsNull() {
            addCriterion("userId_fk_bill is null");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillIsNotNull() {
            addCriterion("userId_fk_bill is not null");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillEqualTo(Integer value) {
            addCriterion("userId_fk_bill =", value, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillNotEqualTo(Integer value) {
            addCriterion("userId_fk_bill <>", value, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillGreaterThan(Integer value) {
            addCriterion("userId_fk_bill >", value, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillGreaterThanOrEqualTo(Integer value) {
            addCriterion("userId_fk_bill >=", value, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillLessThan(Integer value) {
            addCriterion("userId_fk_bill <", value, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillLessThanOrEqualTo(Integer value) {
            addCriterion("userId_fk_bill <=", value, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillIn(List<Integer> values) {
            addCriterion("userId_fk_bill in", values, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillNotIn(List<Integer> values) {
            addCriterion("userId_fk_bill not in", values, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillBetween(Integer value1, Integer value2) {
            addCriterion("userId_fk_bill between", value1, value2, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andUseridFkBillNotBetween(Integer value1, Integer value2) {
            addCriterion("userId_fk_bill not between", value1, value2, "useridFkBill");
            return (Criteria) this;
        }

        public Criteria andChaoincomeIsNull() {
            addCriterion("chaoincome is null");
            return (Criteria) this;
        }

        public Criteria andChaoincomeIsNotNull() {
            addCriterion("chaoincome is not null");
            return (Criteria) this;
        }

        public Criteria andChaoincomeEqualTo(Integer value) {
            addCriterion("chaoincome =", value, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaoincomeNotEqualTo(Integer value) {
            addCriterion("chaoincome <>", value, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaoincomeGreaterThan(Integer value) {
            addCriterion("chaoincome >", value, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaoincomeGreaterThanOrEqualTo(Integer value) {
            addCriterion("chaoincome >=", value, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaoincomeLessThan(Integer value) {
            addCriterion("chaoincome <", value, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaoincomeLessThanOrEqualTo(Integer value) {
            addCriterion("chaoincome <=", value, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaoincomeIn(List<Integer> values) {
            addCriterion("chaoincome in", values, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaoincomeNotIn(List<Integer> values) {
            addCriterion("chaoincome not in", values, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaoincomeBetween(Integer value1, Integer value2) {
            addCriterion("chaoincome between", value1, value2, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaoincomeNotBetween(Integer value1, Integer value2) {
            addCriterion("chaoincome not between", value1, value2, "chaoincome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeIsNull() {
            addCriterion("chaooutcome is null");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeIsNotNull() {
            addCriterion("chaooutcome is not null");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeEqualTo(Integer value) {
            addCriterion("chaooutcome =", value, "chaooutcome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeNotEqualTo(Integer value) {
            addCriterion("chaooutcome <>", value, "chaooutcome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeGreaterThan(Integer value) {
            addCriterion("chaooutcome >", value, "chaooutcome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeGreaterThanOrEqualTo(Integer value) {
            addCriterion("chaooutcome >=", value, "chaooutcome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeLessThan(Integer value) {
            addCriterion("chaooutcome <", value, "chaooutcome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeLessThanOrEqualTo(Integer value) {
            addCriterion("chaooutcome <=", value, "chaooutcome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeIn(List<Integer> values) {
            addCriterion("chaooutcome in", values, "chaooutcome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeNotIn(List<Integer> values) {
            addCriterion("chaooutcome not in", values, "chaooutcome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeBetween(Integer value1, Integer value2) {
            addCriterion("chaooutcome between", value1, value2, "chaooutcome");
            return (Criteria) this;
        }

        public Criteria andChaooutcomeNotBetween(Integer value1, Integer value2) {
            addCriterion("chaooutcome not between", value1, value2, "chaooutcome");
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