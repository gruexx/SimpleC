package pers.shayz.bean;

import java.util.ArrayList;
import java.util.List;

public class GoodsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public GoodsExample() {
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

        public Criteria andGoodsidIsNull() {
            addCriterion("goodsId is null");
            return (Criteria) this;
        }

        public Criteria andGoodsidIsNotNull() {
            addCriterion("goodsId is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsidEqualTo(Integer value) {
            addCriterion("goodsId =", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidNotEqualTo(Integer value) {
            addCriterion("goodsId <>", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidGreaterThan(Integer value) {
            addCriterion("goodsId >", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidGreaterThanOrEqualTo(Integer value) {
            addCriterion("goodsId >=", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidLessThan(Integer value) {
            addCriterion("goodsId <", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidLessThanOrEqualTo(Integer value) {
            addCriterion("goodsId <=", value, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidIn(List<Integer> values) {
            addCriterion("goodsId in", values, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidNotIn(List<Integer> values) {
            addCriterion("goodsId not in", values, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidBetween(Integer value1, Integer value2) {
            addCriterion("goodsId between", value1, value2, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsidNotBetween(Integer value1, Integer value2) {
            addCriterion("goodsId not between", value1, value2, "goodsid");
            return (Criteria) this;
        }

        public Criteria andGoodsnameIsNull() {
            addCriterion("goodsName is null");
            return (Criteria) this;
        }

        public Criteria andGoodsnameIsNotNull() {
            addCriterion("goodsName is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsnameEqualTo(String value) {
            addCriterion("goodsName =", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameNotEqualTo(String value) {
            addCriterion("goodsName <>", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameGreaterThan(String value) {
            addCriterion("goodsName >", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameGreaterThanOrEqualTo(String value) {
            addCriterion("goodsName >=", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameLessThan(String value) {
            addCriterion("goodsName <", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameLessThanOrEqualTo(String value) {
            addCriterion("goodsName <=", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameLike(String value) {
            addCriterion("goodsName like", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameNotLike(String value) {
            addCriterion("goodsName not like", value, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameIn(List<String> values) {
            addCriterion("goodsName in", values, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameNotIn(List<String> values) {
            addCriterion("goodsName not in", values, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameBetween(String value1, String value2) {
            addCriterion("goodsName between", value1, value2, "goodsname");
            return (Criteria) this;
        }

        public Criteria andGoodsnameNotBetween(String value1, String value2) {
            addCriterion("goodsName not between", value1, value2, "goodsname");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsIsNull() {
            addCriterion("classifyId_fk_goods is null");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsIsNotNull() {
            addCriterion("classifyId_fk_goods is not null");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsEqualTo(Integer value) {
            addCriterion("classifyId_fk_goods =", value, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsNotEqualTo(Integer value) {
            addCriterion("classifyId_fk_goods <>", value, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsGreaterThan(Integer value) {
            addCriterion("classifyId_fk_goods >", value, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsGreaterThanOrEqualTo(Integer value) {
            addCriterion("classifyId_fk_goods >=", value, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsLessThan(Integer value) {
            addCriterion("classifyId_fk_goods <", value, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsLessThanOrEqualTo(Integer value) {
            addCriterion("classifyId_fk_goods <=", value, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsIn(List<Integer> values) {
            addCriterion("classifyId_fk_goods in", values, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsNotIn(List<Integer> values) {
            addCriterion("classifyId_fk_goods not in", values, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsBetween(Integer value1, Integer value2) {
            addCriterion("classifyId_fk_goods between", value1, value2, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andClassifyidFkGoodsNotBetween(Integer value1, Integer value2) {
            addCriterion("classifyId_fk_goods not between", value1, value2, "classifyidFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsIsNull() {
            addCriterion("userId_fk_goods is null");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsIsNotNull() {
            addCriterion("userId_fk_goods is not null");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsEqualTo(Integer value) {
            addCriterion("userId_fk_goods =", value, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsNotEqualTo(Integer value) {
            addCriterion("userId_fk_goods <>", value, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsGreaterThan(Integer value) {
            addCriterion("userId_fk_goods >", value, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsGreaterThanOrEqualTo(Integer value) {
            addCriterion("userId_fk_goods >=", value, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsLessThan(Integer value) {
            addCriterion("userId_fk_goods <", value, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsLessThanOrEqualTo(Integer value) {
            addCriterion("userId_fk_goods <=", value, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsIn(List<Integer> values) {
            addCriterion("userId_fk_goods in", values, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsNotIn(List<Integer> values) {
            addCriterion("userId_fk_goods not in", values, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsBetween(Integer value1, Integer value2) {
            addCriterion("userId_fk_goods between", value1, value2, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andUseridFkGoodsNotBetween(Integer value1, Integer value2) {
            addCriterion("userId_fk_goods not between", value1, value2, "useridFkGoods");
            return (Criteria) this;
        }

        public Criteria andGoodspriceIsNull() {
            addCriterion("goodsPrice is null");
            return (Criteria) this;
        }

        public Criteria andGoodspriceIsNotNull() {
            addCriterion("goodsPrice is not null");
            return (Criteria) this;
        }

        public Criteria andGoodspriceEqualTo(Double value) {
            addCriterion("goodsPrice =", value, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodspriceNotEqualTo(Double value) {
            addCriterion("goodsPrice <>", value, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodspriceGreaterThan(Double value) {
            addCriterion("goodsPrice >", value, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodspriceGreaterThanOrEqualTo(Double value) {
            addCriterion("goodsPrice >=", value, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodspriceLessThan(Double value) {
            addCriterion("goodsPrice <", value, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodspriceLessThanOrEqualTo(Double value) {
            addCriterion("goodsPrice <=", value, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodspriceIn(List<Double> values) {
            addCriterion("goodsPrice in", values, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodspriceNotIn(List<Double> values) {
            addCriterion("goodsPrice not in", values, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodspriceBetween(Double value1, Double value2) {
            addCriterion("goodsPrice between", value1, value2, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodspriceNotBetween(Double value1, Double value2) {
            addCriterion("goodsPrice not between", value1, value2, "goodsprice");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberIsNull() {
            addCriterion("goodsNumber is null");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberIsNotNull() {
            addCriterion("goodsNumber is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberEqualTo(Integer value) {
            addCriterion("goodsNumber =", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberNotEqualTo(Integer value) {
            addCriterion("goodsNumber <>", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberGreaterThan(Integer value) {
            addCriterion("goodsNumber >", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberGreaterThanOrEqualTo(Integer value) {
            addCriterion("goodsNumber >=", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberLessThan(Integer value) {
            addCriterion("goodsNumber <", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberLessThanOrEqualTo(Integer value) {
            addCriterion("goodsNumber <=", value, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberIn(List<Integer> values) {
            addCriterion("goodsNumber in", values, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberNotIn(List<Integer> values) {
            addCriterion("goodsNumber not in", values, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberBetween(Integer value1, Integer value2) {
            addCriterion("goodsNumber between", value1, value2, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andGoodsnumberNotBetween(Integer value1, Integer value2) {
            addCriterion("goodsNumber not between", value1, value2, "goodsnumber");
            return (Criteria) this;
        }

        public Criteria andImageIsNull() {
            addCriterion("image is null");
            return (Criteria) this;
        }

        public Criteria andImageIsNotNull() {
            addCriterion("image is not null");
            return (Criteria) this;
        }

        public Criteria andImageEqualTo(String value) {
            addCriterion("image =", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotEqualTo(String value) {
            addCriterion("image <>", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThan(String value) {
            addCriterion("image >", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageGreaterThanOrEqualTo(String value) {
            addCriterion("image >=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThan(String value) {
            addCriterion("image <", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLessThanOrEqualTo(String value) {
            addCriterion("image <=", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageLike(String value) {
            addCriterion("image like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotLike(String value) {
            addCriterion("image not like", value, "image");
            return (Criteria) this;
        }

        public Criteria andImageIn(List<String> values) {
            addCriterion("image in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotIn(List<String> values) {
            addCriterion("image not in", values, "image");
            return (Criteria) this;
        }

        public Criteria andImageBetween(String value1, String value2) {
            addCriterion("image between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andImageNotBetween(String value1, String value2) {
            addCriterion("image not between", value1, value2, "image");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoIsNull() {
            addCriterion("goodsInfo is null");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoIsNotNull() {
            addCriterion("goodsInfo is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoEqualTo(String value) {
            addCriterion("goodsInfo =", value, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoNotEqualTo(String value) {
            addCriterion("goodsInfo <>", value, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoGreaterThan(String value) {
            addCriterion("goodsInfo >", value, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoGreaterThanOrEqualTo(String value) {
            addCriterion("goodsInfo >=", value, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoLessThan(String value) {
            addCriterion("goodsInfo <", value, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoLessThanOrEqualTo(String value) {
            addCriterion("goodsInfo <=", value, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoLike(String value) {
            addCriterion("goodsInfo like", value, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoNotLike(String value) {
            addCriterion("goodsInfo not like", value, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoIn(List<String> values) {
            addCriterion("goodsInfo in", values, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoNotIn(List<String> values) {
            addCriterion("goodsInfo not in", values, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoBetween(String value1, String value2) {
            addCriterion("goodsInfo between", value1, value2, "goodsinfo");
            return (Criteria) this;
        }

        public Criteria andGoodsinfoNotBetween(String value1, String value2) {
            addCriterion("goodsInfo not between", value1, value2, "goodsinfo");
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