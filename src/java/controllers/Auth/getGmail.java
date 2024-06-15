/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controllers.Auth;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import constant.IconstantGmail;
import java.io.IOException;
import models.UserGoogle;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

/**
 *
 * @author AD
 */
public class GetGmail {

    public static String getToken(String code) throws ClientProtocolException, IOException {

        String response = Request.Post(IconstantGmail.GMAIL_LINK_GET_TOKEN)
                .bodyForm(Form.form()
                                .add("client_id", IconstantGmail.GMAIL_CLIENT_ID)
                                .add("client_secret", IconstantGmail.GMAIL_CLIENT_SECRET)
                                .add("redirect_uri", IconstantGmail.GMAIL_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", IconstantGmail.GMAIL_GRANT_TYPE)
                                .build()
                )
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);

        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");

        return accessToken;

    }

    public static UserGoogle getUserInfo(final String accessToken) throws ClientProtocolException, IOException {

        String link = IconstantGmail.GMAIL_LINK_GET_USER_INFO + accessToken;

        String response = Request.Get(link).execute().returnContent().asString();
        System.out.println(response);
        UserGoogle usGG = new Gson().fromJson(response, UserGoogle.class);
        return usGG;
    }
}
