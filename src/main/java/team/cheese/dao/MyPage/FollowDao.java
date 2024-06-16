package team.cheese.dao.MyPage;

import team.cheese.domain.MyPage.UserInfoDTO;

import java.util.List;
import java.util.Map;

public interface FollowDao {
    // 팔로우 등록
    int insertFollow(Map map) throws Exception;

    // 팔로워 수
    int countFollower(String toUser) throws Exception;

    // 팔로잉 수
    int countFollowing(String fromUser) throws Exception;

    // 팔로워 리스트 : 나를 팔로우 하는 사람들의 목록
    List<UserInfoDTO> selectFollowerAll(Map map) throws Exception;

    //  팔로잉 리스트 : 내가 팔로우 하는 사람들의 목록
    List<UserInfoDTO> selectFollowingAll(Map map) throws Exception;

    // 팔로우 취소
    int deleteFollow(Map map) throws Exception;
}
