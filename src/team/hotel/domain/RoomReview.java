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

    private String reviewRoomNum;

    private Short reviewGuestId;

    private Byte reviewScore;

    private String reviewComment;
    
    private String reviewPhoto;


    public Short getReviewId() {
        return reviewId;
    }

    public void setReviewId(Short reviewId) {
        this.reviewId = reviewId;
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

	public String getReviewRoomNum() {
		return reviewRoomNum;
	}

	public void setReviewRoomNum(String reviewRoomNum) {
		this.reviewRoomNum = reviewRoomNum;
	}

	@Override
	public String toString() {
		return "RoomReview [reviewId=" + reviewId + ", reviewRoomNum=" + reviewRoomNum + ", reviewGuestId="
				+ reviewGuestId + ", reviewScore=" + reviewScore + ", reviewComment=" + reviewComment + ", reviewPhoto="
				+ reviewPhoto + "]";
	}

	public RoomReview(Short reviewId, String reviewRoomNum, Short reviewGuestId, Byte reviewScore, String reviewComment,
			String reviewPhoto) {
		super();
		this.reviewId = reviewId;
		this.reviewRoomNum = reviewRoomNum;
		this.reviewGuestId = reviewGuestId;
		this.reviewScore = reviewScore;
		this.reviewComment = reviewComment;
		this.reviewPhoto = reviewPhoto;
	}
    
    
}