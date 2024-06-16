package team.cheese.dao.MyPage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import team.cheese.domain.MyPage.UserInfoDTO;

import java.util.List;
import java.util.Map;

@Repository
public class FollowDaoImpl implements FollowDao {
    @Autowired
    private SqlSession sqlSession;
    private String namespace ="team.cheese.dao.MyPage.FollowDao.";

    // 팔로우 등록
    @Override
    public int insertFollow(Map map) throws Exception {
        return sqlSession.insert(namespace+"insertFollow",map);
    }

    // 팔로워 수
    @Override
    public int countFollower(String toUser) throws Exception {
        return sqlSession.selectOne(namespace+"countFollower",toUser);
    }

    // 팔로잉 수
    @Override
    public int countFollowing(String fromUser) throws Exception {
        return sqlSession.selectOne(namespace+"countFollowing",fromUser);
    }

    // 팔로워 리스트 : 나를 팔로우 하는 사람들의 목록
    @Override
    public List<UserInfoDTO> selectFollowerAll(Map map) throws Exception {
        return sqlSession.selectList(namespace+"selectFollowerAll",map);
    }

    //  팔로잉 리스트 : 내가 팔로우 하는 사람들의 목록
    @Override
    public List<UserInfoDTO> selectFollowingAll(Map map) throws Exception {
        return sqlSession.selectList(namespace+"selectFollowingAll",map);
    }

    // 팔로우 취소
    @Override
    public int deleteFollow(Map map) throws Exception {
        return sqlSession.delete(namespace+"deleteFollow",map);
    }

}
