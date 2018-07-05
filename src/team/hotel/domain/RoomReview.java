package team.hotel.domain;
import java.io.Serializable;
/**
* @author Suqiao Lin
* @version 创建时间：2018年7月5日
* 类说明
*/

public class RoomReview implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Short reviewId;

    private Short reviewRoomId;

    private Short reviewGuestId;

    private Byte reviewScore;

    private String reviewPhoto;

    private String reviewComment;

    public Short getReviewId() {
        return reviewId;
    }

    public void setReviewId(Short reviewId) {
        this.reviewId = reviewId;
    }

    public Short getReviewRoomId() {
        return reviewRoomId;
    }

    public void setReviewRoomId(Short reviewRoomId) {
        this.reviewRoomId = reviewRoomId;
    }

    public Short getReviewGuestId() {
        return reviewGuestId;
    }

    public void setReviewGuestId(Short reviewGuestId) {
        this.reviewGuestId = reviewGuestId;
    }

    public Byte getReviewScore() {
        return reviewScore;
    }

    public void setReviewScore(Byte reviewScore) {
        this.reviewScore = reviewScore;
    }

    public String getReviewPhoto() {
        return reviewPhoto;
    }

    public void setReviewPhoto(String reviewPhoto) {
        this.reviewPhoto = reviewPhoto == null ? null : reviewPhoto.trim();
    }

    public String getReviewComment() {
        return reviewComment;
    }

    public void setReviewComment(String reviewComment) {
        this.reviewComment = reviewComment == null ? null : reviewComment.trim();
    }

	@Override
	public String toString() {
		return "RoomReview [reviewId=" + reviewId + ", reviewRoomId=" + reviewRoomId + ", reviewGuestId="
				+ reviewGuestId + ", reviewScore=" + reviewScore + ", reviewPhoto=" + reviewPhoto + ", reviewComment="
				+ reviewComment + "]";
	}
    
    
}