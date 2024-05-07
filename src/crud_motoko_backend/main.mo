import HashMap "mo:base/HashMap";
import Result "mo:base/Result";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Principal "mo:base/Principal";
import Text "mo:base/Text";
import Iter "mo:base/Iter";

import Types "types";

actor {
  type Member = Types.Member;
  type Result<Ok, Err> = Types.Result<Ok, Err>;
  type HashMap<Ok, Err> = Types.HashMap<Ok, Err>;

  let members = HashMap.HashMap<Principal, Member>(0, Principal.equal, Principal.hash);

  public shared ({ caller }) func addMember(member: Member): async Result<(), Text> {
    switch (members.get(caller)) {
      case (null) {
        members.put(caller, member);
        return #ok;
      };
      case (?member) {
        return #err("Member already exists in our application");
      }
    }
  };
}