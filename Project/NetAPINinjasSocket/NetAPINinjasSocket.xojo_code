#tag Class
Protected Class NetAPINinjasSocket
Inherits URLConnection
	#tag Event
		Sub ContentReceived(URL As String, HTTPStatus As Integer, content As String)
		  DIM json As JSONItem = NEW JSONItem(content)
		  
		  
		  if (URL.IndexOf(me.FactsURL) > -1) then
		    DIM result() As String
		    for i As Integer = 0 to (json.Count() - 1)
		      DIM jsonValue As JSONItem = json.Value(i)
		      result.Append jsonValue.Value("fact")
		      RaiseEvent FactsReceived result
		    next i
		    
		  elseif (URL.IndexOf(me.JokesURL) > -1) then
		    DIM result() As String
		    for i As Integer = 0 to (json.Count() - 1)
		      DIM jsonValue As JSONItem = json.Value(i)
		      result.Append jsonValue.Value("joke")
		      RaiseEvent JokesReceived result
		    next i
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(e As RuntimeException)
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Facts(limit As Integer = 1)
		  me.RequestHeader("X-Api-Key") = me.APIKey
		  me.Send "GET", me.FactsURL + "?limit=" + limit.ToString
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Jokes(limit As Integer = 1)
		  me.RequestHeader("X-Api-Key") = me.APIKey
		  me.Send "GET", me.JokesURL + "?limit=" + limit.ToString
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event FactsReceived(facts() As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event JokesReceived(jokes() As String)
	#tag EndHook


	#tag Property, Flags = &h0
		APIKey As String
	#tag EndProperty


	#tag Constant, Name = FactsURL, Type = String, Dynamic = False, Default = \"https://api.api-ninjas.com/v1/facts", Scope = Private
	#tag EndConstant

	#tag Constant, Name = JokesURL, Type = String, Dynamic = False, Default = \"https://api.api-ninjas.com/v1/jokes", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowCertificateValidation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="HTTPStatusCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="APIKey"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
