interface Interface_TrTripNotifier
	native;

/** Add a trip actor to our list */
simulated function AddTripActor(TrTripActor NewTrip);

/** Remove a trip actor from our list */
simulated function RemoveTripActor(TrTripActor RemoveTrip);

/** Notify the owner of the trip being activated */
simulated function TripActivated(Pawn Other, vector ActivateLocation, TrTripActor TripActor);

/** Called to get the ParticleSystem used for effects */
simulated function ParticleSystem GetParticleSystemName();

/** Fetch the socket position in world-space where the trip starts */
simulated event bool GetTripSocketPosition(bool bIsLeft, out vector SocketPosition);

/** Called when the trip actor is awake */
simulated event OnTripAwake();

/** Called when the trip actor is asleep */
simulated event OnTripSleep();

defaultproperties
{
   Name="Default__Interface_TrTripNotifier"
   ObjectArchetype=Interface'Core.Default__Interface'
}
