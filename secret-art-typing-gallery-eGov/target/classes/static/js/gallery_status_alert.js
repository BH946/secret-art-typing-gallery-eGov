// status 관리 -> gallery.jsp
document.addEventListener('DOMContentLoaded', function() {
	const status = document.body.getAttribute('data-status');
	if (status == 'deleteON') {
		alert('작품을 삭제하였습니다.');
	}
	else if (status == 'deleteOFF') {
		alert('비밀번호가 틀렸습니다.');
	}
	else if (status == 'updateON') {
		alert('작품 수정을 완료하였습니다.');
	}
	else if (status == 'updateOFF') {
		alert('비밀번호가 틀렸습니다.');
	}
	else if (status == 'addON') {
		alert('작품 전시를 완료하였습니다.');
	}
	else if (status == 'notItem') {
		alert('작품이 존재하지 않습니다.');
	}
});