package pack.model;
public interface PostingInter {

	PostDto getDetail(PostDto dto);
	
	boolean updatePostcnt(PostDto dto);
	boolean updatePost(PostDto dto);
	
}
