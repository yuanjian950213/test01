package com.ityuan.pojo;

import java.io.Serializable;
import java.util.List;

public class PagesUtil implements Serializable {

    private Integer totalCount; //总记录数
    private Integer pageSize = 2; //页大小
    private Integer totalpageCount; //总页数 = totalCount/pageSize
    private Integer currPageNo = 1; //当前页
    private List<User> userList;

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        if(totalCount != 0){
            this.totalpageCount = (totalCount % pageSize) == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
        }
        this.totalCount = totalCount;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalpageCount() {
        return totalpageCount;
    }

    public void setTotalpageCount(Integer totalpageCount) {
        this.totalpageCount = totalpageCount;
    }

    public Integer getCurrPageNo() {
        return currPageNo;
    }

    public void setCurrPageNo(Integer currPageNo) {
        this.currPageNo = currPageNo;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    @Override
    public String toString() {
        return "pagesUtil{" +
                "totalCount=" + totalCount +
                ", pageSize=" + pageSize +
                ", totalpageCount=" + totalpageCount +
                ", currPageNo=" + currPageNo +
                ", userList=" + userList +
                '}';
    }
}
