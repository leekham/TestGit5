<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h2>ȸ������ ������</h2>
	<fieldset>
	  <form action="./MemberJoinAction.me" method="post">
		���̵� : <input type="text"  name="id"><br>
		��й�ȣ : <input type="password"  name="pass"><br>
		�̸� : <input type="text"  name="name"><br>
		�г��� : <input type="text"  name="nickname"><br>
		�ڵ�����ȣ : <input type="text"  name="phone"><br>
		�ּ� : <input type="text" id="sample6_postcode" placeholder="�����ȣ">
			<input type="button" onclick="sample6_execDaumPostcode()" value="�����ȣ ã��"><br>
			<input type="text" id="sample6_address" placeholder="�ּ�"><br>
			<input type="text" id="sample6_detailAddress" placeholder="���ּ�">
			<input type="text" id="sample6_extraAddress" placeholder="�����׸�"><br>
		�̸��� : <input type="email"  name="email"><br>
		<input type="hidden" name="num_ip" value="<%=request.getRemoteAddr()%>">
		<input type="submit" value="ȸ������">
			  
	  
	  </form>	
	</fieldset>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function sample6_execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.
		
		                // �� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
		                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
		                var addr = ''; // �ּ� ����
		                var extraAddr = ''; // �����׸� ����
		
		                //����ڰ� ������ �ּ� Ÿ�Կ� ���� �ش� �ּ� ���� �����´�.
		                if (data.userSelectedType === 'R') { // ����ڰ� ���θ� �ּҸ� �������� ���
		                    addr = data.roadAddress;
		                } else { // ����ڰ� ���� �ּҸ� �������� ���(J)
		                    addr = data.jibunAddress;
		                }
		
		                // ����ڰ� ������ �ּҰ� ���θ� Ÿ���϶� �����׸��� �����Ѵ�.
		                if(data.userSelectedType === 'R'){
		                    // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
		                    // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
		                    if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // ǥ���� �����׸��� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // ���յ� �����׸��� �ش� �ʵ忡 �ִ´�.
		                    document.getElementById("sample6_extraAddress").value = extraAddr;
		                
		                } else {
		                    document.getElementById("sample6_extraAddress").value = '';
		                }
		
		                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
		                document.getElementById('sample6_postcode').value = data.zonecode;
		                document.getElementById("sample6_address").value = addr;
		                // Ŀ���� ���ּ� �ʵ�� �̵��Ѵ�.
		                document.getElementById("sample6_detailAddress").focus();
		            }
		        }).open();
		    }
		</script>

</body>
</html>