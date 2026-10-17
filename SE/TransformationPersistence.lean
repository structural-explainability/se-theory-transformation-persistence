module -- shake: keep-all

public import SE.TransformationPersistence.Lift
public import SE.TransformationPersistence.Observer
public import SE.TransformationPersistence.Conformance

/-!
# SE Theory: Transformation and Persistence

The bridge between the Transformation theory and the Persistence theory.

Persistence is generic over an abstract transformation domain and carrier.
Transformation supplies a taxonomy of operators and a state model with
dimensions, footprints and required clauses. This package instantiates the
first at the second:

- `Lift`: a classification stated at family or kind granularity, consumed at
  operator granularity;
- `Observer`: an observer that sees a set of dimensions, and when its
  presentation is sound for a classification of the operators.

Neither upstream theory imports the other. Identity regimes and framework
admissibility belong downstream.
-/
