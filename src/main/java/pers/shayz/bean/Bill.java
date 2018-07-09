package pers.shayz.bean;

import java.util.Date;

public class Bill {
    private Integer billid;

    private Double income;

    private Double outcome;

    private Date date;

    private Integer useridFkBill;

    private Integer chaoincome;

    private Integer chaooutcome;

    public Integer getBillid() {
        return billid;
    }

    public void setBillid(Integer billid) {
        this.billid = billid;
    }

    public Double getIncome() {
        return income;
    }

    public void setIncome(Double income) {
        this.income = income;
    }

    public Double getOutcome() {
        return outcome;
    }

    public void setOutcome(Double outcome) {
        this.outcome = outcome;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getUseridFkBill() {
        return useridFkBill;
    }

    public void setUseridFkBill(Integer useridFkBill) {
        this.useridFkBill = useridFkBill;
    }

    public Integer getChaoincome() {
        return chaoincome;
    }

    public void setChaoincome(Integer chaoincome) {
        this.chaoincome = chaoincome;
    }

    public Integer getChaooutcome() {
        return chaooutcome;
    }

    public void setChaooutcome(Integer chaooutcome) {
        this.chaooutcome = chaooutcome;
    }
}