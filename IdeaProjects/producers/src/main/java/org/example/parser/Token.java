package org.example.parser;
import java.util.HashMap;


/**
 * Possible tokens that come from the Parser
 */
public class Token {
    /**
     * Possible token types
     */

    /** List of all possible tokens */
    public static final Token
            eofTok          = new Token(TokenType.Eof, "<<EOF>>"),
            returnTok       = new Token(TokenType.Return, "return"),

    intTok          = new Token(TokenType.Int, "int"),
            floatTok        = new Token(TokenType.Float, "float"),
            charTok         = new Token(TokenType.Char, "char"),
            voidTok         = new Token(TokenType.Void, "void"),

    boolTok         = new Token(TokenType.Bool, "bool"),
            ifTok           = new Token(TokenType.If, "if"),
            elseTok         = new Token(TokenType.Else, "else"),
            trueTok         = new Token(TokenType.True, "true"),
            falseTok        = new Token(TokenType.False, "false"),
            whileTok        = new Token(TokenType.While, "while"),
            andTok          = new Token(TokenType.And, "&&"),
            orTok           = new Token(TokenType.Or, "||"),

    leftBraceTok    = new Token(TokenType.LeftBrace, "{"),
            rightBraceTok   = new Token(TokenType.RightBrace, "}"),
            leftBracketTok  = new Token(TokenType.LeftBracket, "["),
            rightBracketTok = new Token(TokenType.RightBracket, "]"),
            leftParenTok    = new Token(TokenType.LeftParen, "("),
            rightParenTok   = new Token(TokenType.RightParen, ")"),

    semicolonTok    = new Token(TokenType.Semicolon, ";"),
            commaTok        = new Token(TokenType.Comma, ","),
            assignTok       = new Token(TokenType.Assign, "="),

    eqeqTok         = new Token(TokenType.Equals, "=="),
            ltTok           = new Token(TokenType.Less, "<"),
            lteqTok         = new Token(TokenType.LessEqual, "<="),
            gtTok           = new Token(TokenType.Greater, ">"),
            gteqTok         = new Token(TokenType.GreaterEqual, ">="),
            notTok          = new Token(TokenType.Not, "!"),
            noteqTok        = new Token(TokenType.NotEqual, "!="),

    plusTok         = new Token(TokenType.Plus, "+"),
            minusTok        = new Token(TokenType.Minus, "-"),
            multiplyTok     = new Token(TokenType.Multiply, "*"),
            divideTok       = new Token(TokenType.Divide, "/");

    /** TokenType of token */
    private TokenType type;

    /** Value of token */
    private String value = "";

    /** This maps certain keywords to specific tokens */
    private static HashMap<String, Token> keywords = getKeywordsMap();

    /** @return HashMap with keys as keywords and values as the token for that keyword */
    private static HashMap<String, Token> getKeywordsMap(){
        HashMap<String, Token> kw = new HashMap<String, Token>();

        kw.put("bool", boolTok);
        kw.put("boolean", boolTok);
        kw.put("char", charTok);
        kw.put("int", intTok);
        kw.put("float", floatTok);
        kw.put("void", voidTok);
        kw.put("if", ifTok);
        kw.put("else", elseTok);
        kw.put("true", trueTok);
        kw.put("false", falseTok);
        kw.put("while", whileTok);
        kw.put("return", returnTok);

        return kw;
    }

    /**
     * Checks if a given string is a keyword and returns its corresponding
     * token if it is, else returns an identifier token wih the given string
     * as a parameter.
     *
     * @param name Name to check for
     * @return Keyword token if found, identifier token otherwise
     */
    public static Token keyword(String name) {
        Token keyword = keywords.get(name);
        return keyword == null ? mkIdentTok(name) : keyword;
    }

    /**
     * Create a new token
     * @param t TokenType of token
     * @param v Value of token
     */
    private Token(TokenType t, String v) {
        type = t;
        value = v;
    }

    /**
     * @return TokenType of token
     */
    public TokenType type() {
        return type;
    }

    /**
     * @return Value of token
     */
    public String value() {
        return value;
    }

    /**
     * Make an identifier token from a string
     * @param name Name of identifier
     * @return Token representing given name
     */
    public static Token mkIdentTok(String name) {
        return new Token(TokenType.Identifier, name);
    }

    /**
     * Make an int literal token from a string
     * @param name Int value, in string form
     * @return Token representing int value
     */
    public static Token mkIntLiteral(String name) {
        return new Token(TokenType.IntLiteral, name);
    }

    /**
     * Make a float literal token from a string
     * @param name Float value, in string form
     * @return Token representing float value
     */
    public static Token mkFloatLiteral(String name) {
        return new Token(TokenType.FloatLiteral, name);
    }

    /**
     * Make an char literal token from a string
     * @param name char value, in string form
     * @return Token representing char value
     */
    public static Token mkCharLiteral(String name) {
        return new Token(TokenType.CharLiteral, name);
    }

    @Override
    public String toString() {
        if (type.compareTo(TokenType.Identifier) < 0)
            return value;
        return type + "\t" + value;
    }
    public static void main (String[] args) {
        System.out.println(eofTok);
        System.out.println(whileTok);
    }
} // Token
