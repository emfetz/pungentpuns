require 'savon'

class BingSpell
  attr_reader :value
  
  def initialize(query)
    # Gyoku.convert_symbols_to :camelcase #Use this method when your symbols need a capitalized first letter when converted to XML
    
    client_bing = Savon::Client.new do
      wsdl.document = "http://api.bing.net/search.wsdl?AppID=C46A8496D244DC5CDFA135AD3791C2F6657D56BE&Version=2.2"
      wsdl.endpoint = "http://api.bing.net/soap.asmx"
      wsdl.namespace = "http://schemas.microsoft.com/LiveSearch/2008/03/Search"
      # wsdl.soap_actions = [:search]
    end # end of "Savon::Client.new do"
    
    response = client_bing.request :soap, :searchrequest, body: {
      "parameters" => {
        "Market" => "en-us", 
        "Query" => query, 
        "AppID" => "C46A8496D244DC5CDFA135AD3791C2F6657D56BE", 
        "Sources"  => {
          "SourceType" => "Spell"
        }
      }
    }
    
    if response.success?
      data = response.to_array(:search_response, :parameters, :spell, :results, :spell_result).first
      if data
        @value = data[:value]
      end # end of "if data"
    end # end of "response.success?"
    
  end
end


#### THE TEST BODY ELEMENT OF A SAMPLE REQUEST THAT IS PROVEN TO WORK:----------------------------

#<SearchRequest xmlns="http://schemas.microsoft.com/LiveSearch/2008/03/Search">
#   <parameters>
#      <Market>en-us</Market>
#      <Query>Mispeling words is a common ocurrence.</Query>
#      <AppId>C46A8496D244DC5CDFA135AD3791C2F6657D56BE</AppId>
#      <Sources>
#         <SourceType>Spell</SourceType>
#      </Sources>
#   </parameters>
#</SearchRequest>


#### STRIPPED HASH OF AN EXAMPLE RESPONSE FROM IRB:-----------------------------------------------

#irb(main):016:0> response.to_hash
#=> {
#  :search_response=>{
#    :parameters=>{
#      :spell=>{
#        :results=>{
#          :spell_result=>{
#            :value=>"misspelling"
#}}}}}}


#### SOAP Testing: -------------------------------------------------------------------------------

#clienta = Savon::Client.new("http://www.webservicex.net/uszip.asmx?WSDL")
#clienta.wsdl.soap_actions
#responsea = clienta.request :web, :get_info_by_zip, body: { "USZip" => "90210" }
#responsea.to_hash

#clientb = Savon::Client.new("http://api.bing.net/search.wsdl?AppID=C46A8496D244DC5CDFA135AD3791C2F6657D56BE&Version=2.2")
#clientb.wsdl.soap_actions
#clientb.request :soap, :searchrequest, body: {"parameters" => {"Market" => "en-us", "Query" => "missspelling", "AppID" => "C46A8496D244DC5CDFA135AD3791C2F6657D56BE", "Sources"  => {"SourceType" => "Spell"}}}
#responseb = _
#responseb.to_hash









