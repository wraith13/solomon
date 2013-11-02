/******************************************************************************
    素因数分解コマンドラインツール
        素因数分解ソースファイル
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
//  コンパイル時引数(基本型＋基本型依存要素)
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
//  素因数分解クラステンプレート
//

template<class value_T = VALUE_TYPE>
class prime_factor :public std::vector<value_T>
{
public:
	prime_factor(const value_T & number)
	{
		if (number < -1)
		{
			//	マイナスの場合は符号を逆転させてから処理する。
			push_back(-1);
			value_T temp_number = -number;
			if (number == temp_number)
			{
				//	マイナスの最大値は符号をプラスにすることはできないので先に2で割ってから処理する。
				push_back(2);
				temp_number = -(temp_number /2);
			}
			prime_factor<value_T> temp(temp_number);
			std::copy(temp.begin(), temp.end(), std::back_inserter(*this));
		}
		else
		if (number <= 3)
		{
			//	-1 から 3 の範囲の値であればそのまま素数扱いにする。
			push_back(number);
		}
		else
		{
			//	4 以上の値...
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
					//	これ以上 p を大きくしても x 以外で割り切れることはない。
					push_back(x);
					break;
				}
				
				while(0 == x %p)
				{
					x /= p;
					push_back(p);
				}
				
				p += 2;
				//	ここで p は奇数である保証しかなく素数であるとは限らないが、p が素数であることを
				//	確認するコストは 0 == x %p を評価するコストよりも高くなり、p が素数かどうか判定し
				//	素数でない p をスキップすることは改悪にしかならないので、そんなことはしないこと。
			}
		}
	}
};


///////////////////////////////////////////////////////////////////////////////
//
//  コンテナ to 文字列
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
//  コマンドライン インターフェイス
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
		fprintf(stderr, "エラー(%s)が発生しました。", err.what()); 
	}
	catch(...)
	{
		fprintf(stderr, "不明なエラーが発生しました。"); 
	}
	
	return EXIT_FAILURE;
}
#endif


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: ここから下はテスト用コード
//

#if defined(AUTO_SELF_TEST_BUILD)


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: コンテナ初期化クラス
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
//  TEST: テスト結果出力
//

#define TEST_ASSERT(TITLE, X) test_assert_body(TITLE, X, #X)
bool test_assert_body(const char * assert_title, bool assert_result, const char * assert_expression)
{
	//	この標準出力へのHTMLの書き出しはこのプログラムを呼び出すバッチファイル
	//	によってHTMLファイルへとリダイレクトされます。
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
		//	コンソール上で確認し易いように失敗したエラーは標準エラーにも書き出す。
		fprintf(stderr, "TEST FAILD: [%s]: %s\n", assert_title, assert_expression); 
	}
	return assert_result;
}


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: ビルド情報
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

#define TEST_TITLE __FILE__ " " BUILD_BIT_EDTION " " BUILD_MODE "ビルド テスト結果"


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: マクロ情報出力ツール
//

#define TO_STRING(X) TO_STRING_CORE(X)
#define TO_STRING_CORE(X) #X
#define PRINT_MACRO(X) puts("<dt>" #X "</dt><dd>" TO_STRING(X) "</dd>")


///////////////////////////////////////////////////////////////////////////////
//
//  TEST: テスト
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
			TEST_ASSERT("フォーマッター(1要素)", "42" == to_string(array(42),"x")) &
			TEST_ASSERT("フォーマッター(2要素)", "4x2" == to_string(array(4)(2),"x")) &
			TEST_ASSERT("フォーマッター(3要素)", "0x1x2" == to_string(array(0)(1)(2),"x")) &
			TEST_ASSERT("素因数分解(0)", "0" == to_string(prime_factor<>(0),"x")) &
			TEST_ASSERT("素因数分解(1)", "1" == to_string(prime_factor<>(1),"x")) &
			TEST_ASSERT("素因数分解(2)", "2" == to_string(prime_factor<>(2),"x")) &
			TEST_ASSERT("素因数分解(3)", "3" == to_string(prime_factor<>(3),"x")) &
			TEST_ASSERT("素因数分解(4)", "2x2" == to_string(prime_factor<>(4),"x")) &
			TEST_ASSERT("素因数分解(5)", "5" == to_string(prime_factor<>(5),"x")) &
			TEST_ASSERT("素因数分解(6)", "2x3" == to_string(prime_factor<>(6),"x")) &
			TEST_ASSERT("素因数分解(7)", "7" == to_string(prime_factor<>(7),"x")) &
			TEST_ASSERT("素因数分解(8)", "2x2x2" == to_string(prime_factor<>(8),"x")) &
			TEST_ASSERT("素因数分解(9)", "3x3" == to_string(prime_factor<>(9),"x")) &
			TEST_ASSERT("素因数分解(10)", "2x5" == to_string(prime_factor<>(10),"x")) &
			TEST_ASSERT("素因数分解(11)", "11" == to_string(prime_factor<>(11),"x")) &
			TEST_ASSERT("素因数分解(12)", "2x2x3" == to_string(prime_factor<>(12),"x")) &
			TEST_ASSERT("素因数分解(13)", "13" == to_string(prime_factor<>(13),"x")) &
			TEST_ASSERT("素因数分解(14)", "2x7" == to_string(prime_factor<>(14),"x")) &
			TEST_ASSERT("素因数分解(15)", "3x5" == to_string(prime_factor<>(15),"x")) &
			TEST_ASSERT("素因数分解(16)", "2x2x2x2" == to_string(prime_factor<>(16),"x")) &
			TEST_ASSERT("素因数分解(17)", "17" == to_string(prime_factor<>(17),"x")) &
			TEST_ASSERT("素因数分解(18)", "2x3x3" == to_string(prime_factor<>(18),"x")) &
			TEST_ASSERT("素因数分解(19)", "19" == to_string(prime_factor<>(19),"x")) &
			TEST_ASSERT("素因数分解(20)", "2x2x5" == to_string(prime_factor<>(20),"x")) &
			TEST_ASSERT("素因数分解(1000)", "2x2x2x5x5x5" == to_string(prime_factor<>(1000),"x")) &
			TEST_ASSERT("素因数分解(9999999)", "3x3x239x4649" == to_string(prime_factor<>(9999999),"x")) &
			TEST_ASSERT("素因数分解(-1)", "-1" == to_string(prime_factor<>(-1),"x")) &
			TEST_ASSERT("素因数分解(-2)", "-1x2" == to_string(prime_factor<>(-2),"x")) &
			TEST_ASSERT("素因数分解(-3)", "-1x3" == to_string(prime_factor<>(-3),"x")) &
			TEST_ASSERT("素因数分解(-4)", "-1x2x2" == to_string(prime_factor<>(-4),"x")) &
			TEST_ASSERT("素因数分解(-5)", "-1x5" == to_string(prime_factor<>(-5),"x")) &
			TEST_ASSERT("素因数分解(-6)", "-1x2x3" == to_string(prime_factor<>(-6),"x")) &
			true // 最終行にも & をつけられるようにする為のターミネーター。
		) ? EXIT_SUCCESS: EXIT_FAILURE;
		puts("</table>");
		
		puts("<h2>コンパイル時引数</h2>");
		puts("<dl>");
		PRINT_MACRO(VALUE_TYPE);
		PRINT_MACRO(STRING_TO_VALUE);
		PRINT_MACRO(VALUE_FORMAT);
		PRINT_MACRO(VALUE_SEPARATOR);
		puts("</dl>");
		
		puts("<h2>定義済みマクロ</h2>");
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
		fprintf(stderr, "エラー(%s)が発生しました。", err.what()); 
	}
	catch(...)
	{
		fprintf(stderr, "不明なエラーが発生しました。"); 
	}
	
	return EXIT_FAILURE;
}


#endif // defined(AUTO_SELF_TEST_BUILD)


/******************************************************************************
    □■□■                  Wraith the Trickster                  □■□■
    ■□■□ ～I'll go with heaven's advantage and fool's wisdom.～ ■□■□
******************************************************************************/
