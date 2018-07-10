package pers.shayz.bean;

public class LotteryDraw {
    private Integer lotteryDrawid;

    private Integer useridfklotterDraw;

    private String lotteryDrawdetils;

    private String lotteryDrawdate;

    public Integer getLotteryDrawid() {
        return lotteryDrawid;
    }

    public void setLotteryDrawid(Integer lotteryDrawid) {
        this.lotteryDrawid = lotteryDrawid;
    }

    public Integer getUseridfklotterDraw() {
        return useridfklotterDraw;
    }

    public void setUseridfklotterDraw(Integer useridfklotterDraw) {
        this.useridfklotterDraw = useridfklotterDraw;
    }

    public String getLotteryDrawdetils() {
        return lotteryDrawdetils;
    }

    public void setLotteryDrawdetils(String lotteryDrawdetils) {
        this.lotteryDrawdetils = lotteryDrawdetils == null ? null : lotteryDrawdetils.trim();
    }

    public String getLotteryDrawdate() {
        return lotteryDrawdate;
    }

    public void setLotteryDrawdate(String lotteryDrawdate) {
        this.lotteryDrawdate = lotteryDrawdate == null ? null : lotteryDrawdate.trim();
    }
}