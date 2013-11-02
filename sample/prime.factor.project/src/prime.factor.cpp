/******************************************************************************
    �f���������R�}���h���C���c�[��
        �f���������\�[�X�t�@�C��
                                            Coded by Wraith in Sep 24, 2013.
******************************************************************************/


///////////////////////////////////////////////////////////////////////////////
//
//  ...
//

#define _CRT_SECURE_NO_WARNINGS


///////////////////////////////////////////////////////////////////////////////
//
//  include
//

#include <stdio.h>
#include <stdlib.h>
#include <exception>
#include <vector>
#include <string>
#include <iterator>


///////////////////////////////////////////////////////////////////////////////
//
//  �R���p�C��������(��{�^�{��{�^�ˑ��v�f)
//

#if !defined(VALUE_TYPE)
#define VALUE_TYPE __int64
#endif

#if !defined(STRING_TO_VALUE)
#define STRING_TO_VALUE _atoi64
#endif

#if !defined(VALUE_FORMAT)
#define VALUE_FORMAT "%I64d"
#endif

#if !defined(VALUE_SEPARATOR)
#define VALUE_SEPARATOR "x"
#endif


///////////////////////////////////////////////////////////////////////////////
//
//  �f���������N���X�e���v���[�g
//

template<class value_T = VALUE_TYPE>
class prime_factor :public std::vector<value_T>
{
public:
	prime_factor(const value_T & number)
	{
		if (number < -1)
		{
			//	�}�C�i�X�̏ꍇ�͕������t�]�����Ă��珈������B
			push_back(-1);
			value_T temp_number = -number;
			if (number == temp_number)
			{
				//	�}�C�i�X�̍ő�l�͕������v���X�ɂ��邱�Ƃ͂ł��Ȃ��̂Ő��2�Ŋ����Ă��珈������B
				push_back(2);
				temp_number = -(temp_number /2);
			}
			prime_factor<value_T> temp(temp_number);
			std::copy(temp.begin(), temp.end(), std::back_inserter(*this));
		}
		else
		if (number <= 3)
		{
			//	-1 ���� 3 �͈̔͂̒l�ł���΂��̂܂ܑf�������ɂ���B
			push_back(number);
		}
		else
		{
			//	4 �ȏ�̒l...
			value_T x = number;
			value_T p = 2;
			
			while(0 == x %p)
			{
				x /= p;
				push_back(p);
			}
			
			
			++p; // p = 3
			while(1 != x)
			{
				value_T pp = p *p;
				if (x < pp || pp < p)
				{
					//	����ȏ� p ��傫�����Ă� x �ȊO�Ŋ���؂�邱�Ƃ͂Ȃ��B
					push_back(x);
					break;
				}
				
				while(0 == x %p)
				{
					x /= p;
					push_back(p);
				}
				
				p += 2;
				//	������ p �͊�ł���ۏ؂����Ȃ��f���ł���Ƃ͌���Ȃ����Ap ���f���ł��邱�Ƃ�
				//	�m�F����R�X�g�� 0 == x %p ��]������R�X�g���������Ȃ�Ap ���f�����ǂ������肵
				//	�f���łȂ� p ���X�L�b�v���邱�Ƃ͉����ɂ����Ȃ�Ȃ��̂ŁA����Ȃ��Ƃ͂��Ȃ����ƁB
			}
		}
	}
};


///////////////////////////////////////////////////////////////////////////////
//
//  �R���e�i to ������
//

template<class container_type>
std::string to_string(const container_type & v, const std::string & separator = VALUE_SEPARATOR, const char * format = VALUE_FORMAT)
{
	std::string result;
	container_type::const_iterator i = v.begin(), end = v.end();
	if (i != end)
	{
		char buffer[256];
		
		sprintf(buffer, format, *i);
		result += buffer;
		
		while(++i != end)
		{
			result += separator;
			
			sprintf(buffer, format, *i);
			result += buffer;
		}
	}
	return result;
}


///////////////////////////////////////////////////////////////////////////////
//
//  �R�}���h���C�� �C���^�[�t�F�C�X
//

#if !defined(AUTO_SELF_TEST_BUILD)
int main(int argc, char * argv[])
{
	try
	{
		for(int i = 1; i < argc; ++i)
		{
			VALUE_TYPE x = STRING_TO_VALUE(argv[i]);
			printf(VALUE_FORMAT "=%s\n", x, to_string(prime_factor<VALUE_TYPE>(x)).c_str());
		}

		return EXIT_SUCCESS;
	}
	catch(std::exception err)
	{
		fprintf(stderr, "�G���[(%s)���������܂����B", err.what()); 
	}
	catch(...)
	{
		fprintf(stderr, "�s���ȃG���[���������܂����B"); 
	}
	
	return EXIT_FAILURE;
}
#endif


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: �������牺�̓e�X�g�p�R�[�h
//

#if defined(AUTO_SELF_TEST_BUILD)


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: �R���e�i�������N���X
//

template<class container_type>
class container_initilizer :public container_type
{
public:
	container_initilizer(const typename container_type::value_type & i)
	{
		push_back(i);
	}
	container_initilizer & operator()(const typename container_type::value_type & i)
	{
		push_back(i);
		return *this;
	}
};


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: �e�X�g���ʏo��
//

#define TEST_ASSERT(TITLE, X) test_assert_body(TITLE, X, #X)
bool test_assert_body(const char * assert_title, bool assert_result, const char * assert_expression)
{
	//	���̕W���o�͂ւ�HTML�̏����o���͂��̃v���O�������Ăяo���o�b�`�t�@�C��
	//	�ɂ����HTML�t�@�C���ւƃ��_�C���N�g����܂��B
	printf
	(
		"<tr><td>%s</td><td>%s</td>%s</tr>\n",
		assert_title,
		assert_expression,
		assert_result ?
			"<td class=\"success\">success</td>":
			"<td class=\"fail\">fail</td>"
	);
	
	if (!assert_result)
	{
		//	�R���\�[����Ŋm�F���Ղ��悤�Ɏ��s�����G���[�͕W���G���[�ɂ������o���B
		fprintf(stderr, "TEST FAILD: [%s]: %s\n", assert_title, assert_expression); 
	}
	return assert_result;
}


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: �r���h���
//

#if defined(_M_IX86)
#define BUILD_BIT_EDTION "32bit"
#else
#define BUILD_BIT_EDTION "64bit"
#endif

#if defined(NDEBUG)
#define BUILD_MODE "release"
#else
#define BUILD_MODE "debug"
#endif

#define TEST_TITLE __FILE__ " " BUILD_BIT_EDTION " " BUILD_MODE "�r���h �e�X�g����"


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: �}�N�����o�̓c�[��
//

#define TO_STRING(X) TO_STRING_CORE(X)
#define TO_STRING_CORE(X) #X
#define PRINT_MACRO(X) puts("<dt>" #X "</dt><dd>" TO_STRING(X) "</dd>")


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: �e�X�g
//

int main(int, char * [])
{
	try
	{
		typedef container_initilizer< std::vector<VALUE_TYPE> > array;
		puts("<title>" TEST_TITLE "</title>");
		puts("<style>");
		puts("body,table { font-family: 'MS Gothic'; }");
		puts("h1, h2 { text-decoration: underline; }");
		puts("table { border-collapse:collapse; }");
		puts("th, td { border-bottom:1px solid #FFFFFF; border-right:1px solid #FFFFFF; padding:4px; }");
		puts("th { background-color: #A0C0F8; }");
		puts("tr:nth-child(2n) { background-color: #F0F8F8; }");
		puts("tr:nth-child(2n+1) { background-color: #D8E0F8; }");
		puts(".success { background-color: #66DD66; text-align:center; }");
		puts(".fail { background-color: #EE6666; text-align:center; }");
		puts("</style>");
		puts("<h1>" TEST_TITLE "</h1>");
		puts("<table>");
		puts("<tr><th>title</th><th>test</th><th>result</th><tr>");
		int result =
		(
			TEST_ASSERT("�t�H�[�}�b�^�[(1�v�f)", "42" == to_string(array(42),"x")) &
			TEST_ASSERT("�t�H�[�}�b�^�[(2�v�f)", "4x2" == to_string(array(4)(2),"x")) &
			TEST_ASSERT("�t�H�[�}�b�^�[(3�v�f)", "0x1x2" == to_string(array(0)(1)(2),"x")) &
			TEST_ASSERT("�f��������(0)", "0" == to_string(prime_factor<>(0),"x")) &
			TEST_ASSERT("�f��������(1)", "1" == to_string(prime_factor<>(1),"x")) &
			TEST_ASSERT("�f��������(2)", "2" == to_string(prime_factor<>(2),"x")) &
			TEST_ASSERT("�f��������(3)", "3" == to_string(prime_factor<>(3),"x")) &
			TEST_ASSERT("�f��������(4)", "2x2" == to_string(prime_factor<>(4),"x")) &
			TEST_ASSERT("�f��������(5)", "5" == to_string(prime_factor<>(5),"x")) &
			TEST_ASSERT("�f��������(6)", "2x3" == to_string(prime_factor<>(6),"x")) &
			TEST_ASSERT("�f��������(7)", "7" == to_string(prime_factor<>(7),"x")) &
			TEST_ASSERT("�f��������(8)", "2x2x2" == to_string(prime_factor<>(8),"x")) &
			TEST_ASSERT("�f��������(9)", "3x3" == to_string(prime_factor<>(9),"x")) &
			TEST_ASSERT("�f��������(10)", "2x5" == to_string(prime_factor<>(10),"x")) &
			TEST_ASSERT("�f��������(11)", "11" == to_string(prime_factor<>(11),"x")) &
			TEST_ASSERT("�f��������(12)", "2x2x3" == to_string(prime_factor<>(12),"x")) &
			TEST_ASSERT("�f��������(13)", "13" == to_string(prime_factor<>(13),"x")) &
			TEST_ASSERT("�f��������(14)", "2x7" == to_string(prime_factor<>(14),"x")) &
			TEST_ASSERT("�f��������(15)", "3x5" == to_string(prime_factor<>(15),"x")) &
			TEST_ASSERT("�f��������(16)", "2x2x2x2" == to_string(prime_factor<>(16),"x")) &
			TEST_ASSERT("�f��������(17)", "17" == to_string(prime_factor<>(17),"x")) &
			TEST_ASSERT("�f��������(18)", "2x3x3" == to_string(prime_factor<>(18),"x")) &
			TEST_ASSERT("�f��������(19)", "19" == to_string(prime_factor<>(19),"x")) &
			TEST_ASSERT("�f��������(20)", "2x2x5" == to_string(prime_factor<>(20),"x")) &
			TEST_ASSERT("�f��������(1000)", "2x2x2x5x5x5" == to_string(prime_factor<>(1000),"x")) &
			TEST_ASSERT("�f��������(9999999)", "3x3x239x4649" == to_string(prime_factor<>(9999999),"x")) &
			TEST_ASSERT("�f��������(-1)", "-1" == to_string(prime_factor<>(-1),"x")) &
			TEST_ASSERT("�f��������(-2)", "-1x2" == to_string(prime_factor<>(-2),"x")) &
			TEST_ASSERT("�f��������(-3)", "-1x3" == to_string(prime_factor<>(-3),"x")) &
			TEST_ASSERT("�f��������(-4)", "-1x2x2" == to_string(prime_factor<>(-4),"x")) &
			TEST_ASSERT("�f��������(-5)", "-1x5" == to_string(prime_factor<>(-5),"x")) &
			TEST_ASSERT("�f��������(-6)", "-1x2x3" == to_string(prime_factor<>(-6),"x")) &
			true // �ŏI�s�ɂ� & ��������悤�ɂ���ׂ̃^�[�~�l�[�^�[�B
		) ? EXIT_SUCCESS: EXIT_FAILURE;
		puts("</table>");
		
		puts("<h2>�R���p�C��������</h2>");
		puts("<dl>");
		PRINT_MACRO(VALUE_TYPE);
		PRINT_MACRO(STRING_TO_VALUE);
		PRINT_MACRO(VALUE_FORMAT);
		PRINT_MACRO(VALUE_SEPARATOR);
		puts("</dl>");
		
		puts("<h2>��`�ς݃}�N��</h2>");
		puts("<dl>");
		PRINT_MACRO(__DATE__);
		PRINT_MACRO(__TIME__);
		PRINT_MACRO(__cplusplus);
#if defined(__INTEL_COMPILER)
		PRINT_MACRO(__INTEL_COMPILER);
#endif
#if defined(__GNUC__)
		PRINT_MACRO(__GNUC__);
#endif
#if defined(__GNUC_MINOR__)
		PRINT_MACRO(__GNUC_MINOR__);
#endif
#if defined(__VERSION__)
		PRINT_MACRO(__VERSION__);
#endif
#if defined(__WATCOMC__)
		PRINT_MACRO(__WATCOMC__);
#endif
#if defined(__BORLANDC__)
		PRINT_MACRO(__BORLANDC__);
#endif
#if defined(_MSC_VER)
		PRINT_MACRO(_MSC_VER);
#endif
#if defined(_MSC_FULL_VER)
		PRINT_MACRO(_MSC_FULL_VER);
#endif
#if defined(__MWERKS__)
		PRINT_MACRO(__MWERKS__);
#endif
#if defined(__DMC__)
		PRINT_MACRO(__DMC__);
#endif
		puts("</dl>");
		
		return result;
	}
	catch(std::exception err)
	{
		fprintf(stderr, "�G���[(%s)���������܂����B", err.what()); 
	}
	catch(...)
	{
		fprintf(stderr, "�s���ȃG���[���������܂����B"); 
	}
	
	return EXIT_FAILURE;
}


#endif // defined(AUTO_SELF_TEST_BUILD)


/******************************************************************************
    ��������                  Wraith the Trickster                  ��������
    �������� �`I'll go with heaven's advantage and fool's wisdom.�` ��������
******************************************************************************/
