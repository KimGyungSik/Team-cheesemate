package team.cheese.domain.MyPage;

import java.sql.Timestamp;
import java.util.Objects;

public class FollowDTO {
    private String fromUser;
    private String toUser;
    private Timestamp r_date;
    private Timestamp first_date;
    private String first_id;
    private Timestamp last_date;
    private String last_id;

    public FollowDTO() {} // 기본 생성자

    public FollowDTO(String fromUser,String toUser) {
        this.fromUser = fromUser;
        this.toUser = toUser;
    }

    @Override
    public String toString() {
        return "FollowDTO{" +
                "fromUser='" + fromUser + '\'' +
                ", toUser='" + toUser + '\'' +
                ", r_date=" + r_date +
                ", first_date=" + first_date +
                ", first_id='" + first_id + '\'' +
                ", last_date=" + last_date +
                ", last_id='" + last_id + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FollowDTO followDTO = (FollowDTO) o;
        return Objects.equals(fromUser, followDTO.fromUser) && Objects.equals(toUser, followDTO.toUser) && Objects.equals(r_date, followDTO.r_date) && Objects.equals(first_date, followDTO.first_date) && Objects.equals(first_id, followDTO.first_id) && Objects.equals(last_date, followDTO.last_date) && Objects.equals(last_id, followDTO.last_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(fromUser, toUser, r_date, first_date, first_id, last_date, last_id);
    }

    public String getFromUser() {
        return fromUser;
    }

    public void setFromUser(String fromUser) {
        this.fromUser = fromUser;
    }

    public String getToUser() {
        return toUser;
    }

    public void setToUser(String toUser) {
        this.toUser = toUser;
    }

    public Timestamp getR_date() {
        return r_date;
    }

    public void setR_date(Timestamp r_date) {
        this.r_date = r_date;
    }

    public Timestamp getFirst_date() {
        return first_date;
    }

    public void setFirst_date(Timestamp first_date) {
        this.first_date = first_date;
    }

    public String getFirst_id() {
        return first_id;
    }

    public void setFirst_id(String first_id) {
        this.first_id = first_id;
    }

    public Timestamp getLast_date() {
        return last_date;
    }

    public void setLast_date(Timestamp last_date) {
        this.last_date = last_date;
    }

    public String getLast_id() {
        return last_id;
    }

    public void setLast_id(String last_id) {
        this.last_id = last_id;
    }
}
